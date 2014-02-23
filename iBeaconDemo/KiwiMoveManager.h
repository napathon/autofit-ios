//
//  KiwiMoveManager.h
//  hackathon
//
//  Created by Marko Kudjerski on 2/22/2014.
//

#import <Foundation/Foundation.h>
#import <SocketIO.h>

@interface KiwiMoveManager : NSObject<SocketIODelegate>

+ (instancetype)sharedManager;
- (BOOL)connect;
- (void)addData:(float)a;
- (BOOL)repDetectedWithData:(float)a;

@end
