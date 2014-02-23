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

@end

static KiwiMoveManager *_sharedInstance = nil;

@implementation KiwiMoveManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[KiwiMoveManager alloc] init];
    });
    return _sharedInstance;
}

- (BOOL)connect {
    self.socketIO = [[SocketIO alloc] initWithDelegate:_sharedInstance];
    [self.socketIO connectToHost:@"build.kiwiwearables.com" onPort:8080];
    
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

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet {
    NSLog(@"didReceiveEvent() >>> data: %@", packet.data);
    
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
                NSLog(@"ax: %@", [readout objectForKey:@"ax"]);
            }
        }
    }
}
@end
