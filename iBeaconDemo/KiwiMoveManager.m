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
static int _nextElementIndex;
static int _valueBuffer = 120;

@implementation KiwiMoveManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[KiwiMoveManager alloc] init];
        _accelerationLog = [ [NSMutableArray alloc] initWithCapacity:_valueBuffer ];
        _nextElementIndex = 0;
        
    });
    return _sharedInstance;
}

- (BOOL)connect {
    self.socketIO = [[SocketIO alloc] initWithDelegate:_sharedInstance];
    [self.socketIO connectToHost:@"build.kiwiwearables.com" onPort:8080];
    self.reps = 0;
    
    return true;
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

- (void) addData:(float)az {
    [ _accelerationLog insertObject:[NSNumber numberWithFloat:az] atIndex:_nextElementIndex ];
    _nextElementIndex = (_nextElementIndex + 1) % _valueBuffer;
    NSLog(@"az: %f", az);
}

- (BOOL) repDetected {
    return false;
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
                float az = [[readout objectForKey:@"az"] floatValue];
                [self addData:az];
                if ([self repDetected]) {
                    self.reps += 1;
                    NSLog(@"Rep %d", self.reps);
                }
            }
        }
    }
}
@end
