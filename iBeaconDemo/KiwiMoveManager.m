//
//  KiwiMoveManager.m
//  hackathon
//
//  Created by Marko Kudjerski on 2/22/2014.
//

#import "KiwiMoveManager.h"
#import <SocketIO.h>

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
    SocketIO *socketIO = [[SocketIO alloc] initWithDelegate:_sharedInstance];
    [socketIO connectToHost:@"build.kiwiwearables.com" onPort:8080];
     
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"device_id" forKey:@"30"];
    [dict setObject:@"password" forKey:@"123"];
    
    [socketIO sendEvent:@"listen" withData:dict];
    
    return true;
}

- (void) socketIO:(SocketIO *)socket didReceiveMessage:(SocketIOPacket *)packet {
}

- (void) socketIO:(SocketIO *)socket didReceiveJSON:(SocketIOPacket *)packet {
}

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet {
}
@end
