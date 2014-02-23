//
//  CSMBeaconRegion.m
//  iBeacons_Demo
//
//  Created by napathon on 9/16/13.
//  Copyright (c) 2013 napathon. All rights reserved.
//

#import "CSMBeaconRegion.h"
#import "hackathonDelegate.h"


static CSMBeaconRegion *_sharedInstance = nil;

@implementation CSMBeaconRegion

+ (instancetype)targetRegion {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[CSMBeaconRegion alloc] init];
    });
    return _sharedInstance;
}

- (id)init {
    
    // initialize a new CLBeaconRegion with application-specific UUID and human-readable identifier
    self = [super initWithProximityUUID:[hackathonDelegate appDelegate].myUUID
                                              identifier:kUniqueRegionIdentifier];
    
    if (self) {
        self.notifyEntryStateOnDisplay = NO;     // only notify user if app is active
        self.notifyOnEntry = NO;                 // don't notify user on region entrance
        self.notifyOnExit = YES;                 // notify user on region exit
    }
    return self;
}

@end
