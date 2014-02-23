//
//  KiwiMoveManager.m
//  hackathon
//
//  Created by Marko Kudjerski on 2/22/2014.
//

#import "KiwiMoveManager.h"
#import <SocketIO.h>
#import <SocketIOPacket.h>

@interface KiwiMoveManager()

@property(nonatomic, strong) SocketIO *socketIO;
@property(nonatomic) int reps;

@end

static KiwiMoveManager *_sharedInstance = nil;
static NSMutableArray *_accelerationLog;
static int _currentElementIndex;
static int _valueBuffer = 120;
static float _detectionTreshold = 1.0f;

@implementation KiwiMoveManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[KiwiMoveManager alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleExerciseStarted:)
                                                     name:kWorkoutStartedNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleExerciseFinished:)
                                                     name:kWorkoutFinishedNotification
                                                   object:nil];
    });
    return _sharedInstance;
}

- (BOOL)connect {
    self.socketIO = [[SocketIO alloc] initWithDelegate:_sharedInstance];
    [self.socketIO connectToHost:@"build.kiwiwearables.com" onPort:8080];
    self.reps = 0;
    _accelerationLog = [ [NSMutableArray alloc] initWithCapacity:_valueBuffer ];
    _currentElementIndex = -1;
    
    return true;
}

- (void)disconnect {
    [self.socketIO disconnect];
}

- (void)handleExerciseStarted:(NSNotification*)notification {
    [self connect];
}

- (void)handleExerciseFinished:(NSNotification*)notification {
    [self disconnect];
}

- (void) socketIODidConnect:(SocketIO *)socket {
    NSLog(@"socket connected");
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"30" forKey:@"device_id"];
    [dict setObject:@"123" forKey:@"password"];
    
    [self.socketIO sendEvent:@"listen" withData:dict];
}

- (void) socketIODidDisconnect:(SocketIO *)socket disconnectedWithError:(NSError *)error {
    NSLog(@"socket disconnected");
}

- (void) socketIO:(SocketIO *)socket didReceiveMessage:(SocketIOPacket *)packet {
    NSLog(@"message received");
}

- (void) socketIO:(SocketIO *)socket didReceiveJSON:(SocketIOPacket *)packet {
    NSLog(@"JSON received");
}

- (void) addData:(float)a {
    _currentElementIndex = (_currentElementIndex + 1) % _valueBuffer;
    [ _accelerationLog insertObject:[NSNumber numberWithFloat:a] atIndex:_currentElementIndex ];
    NSLog(@"a: %f", a);
}

- (BOOL) repDetectedWithData:(float)a {
    BOOL detected = false;
    if ((_currentElementIndex >= 0) && abs(abs([(NSNumber *)[_accelerationLog objectAtIndex:_currentElementIndex] floatValue]) - abs(a)) > _detectionTreshold) {
        detected = true;
    }
    [self addData:a];
    return detected;
}

- (void)processDataAndNotify:(NSDictionary*) readout {
    float ax = [[readout objectForKey:@"ax"] floatValue];
    float ay = [[readout objectForKey:@"ay"] floatValue];
    float az = [[readout objectForKey:@"az"] floatValue];
    float a = sqrtf(ax*ax + ay*ay + az*az);
    if ([self repDetectedWithData:a]) {
        self.reps += 1;
        [[NSNotificationCenter defaultCenter] postNotificationName:kRepCompletedNotification
                                                            object:Nil
                                                          userInfo:@{@"repNum" : [NSNumber numberWithFloat:self.reps]}];
    }
}

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet {
    NSError *jsonParsingError = nil;
    NSDictionary *kiwireadout =
        [NSJSONSerialization
            JSONObjectWithData:[packet.data dataUsingEncoding:NSUTF8StringEncoding]
            options:0
            error:&jsonParsingError];
    
    if (!kiwireadout) {
        NSLog(@"Error parsing JSON: %@", jsonParsingError);
    }
    else {
        if ([[kiwireadout objectForKey:@"name"] isEqualToString:@"listen_response"]) {
            NSArray *args = [kiwireadout objectForKey:@"args"];
            
            NSDictionary *message = [args objectAtIndex:0];
            
            NSDictionary *readout = [NSJSONSerialization
                                     JSONObjectWithData:[[message objectForKey:@"message"] dataUsingEncoding:NSUTF8StringEncoding]
                                     options:0
                                     error:&jsonParsingError];
            
            if (!readout) {
                NSLog(@"Error parsing JSON: %@", jsonParsingError);
            }
            else {
                [self processDataAndNotify: readout];
            }
        }
    }
}
@end
