//
//  CSMLocationManager.h
//  iBeacons_Demo
//
//  Created by napathon on 9/5/13.
//  Copyright (c) 2013 napathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface HackLocationManager : NSObject<CLLocationManagerDelegate>

+ (instancetype)sharedManager;
- (void)initializePeripheralManager;
- (void)initializeRegionMonitoring;
- (void)stopMonitoringForRegion:(CLBeaconRegion*)region;
- (void)stopAdvertisingBeacon;
- (void)fireUpdateNotificationForStatus:(NSString*)status;
- (void)fireUpdateNotificationForStatus:(NSString*)status withInfo:(NSDictionary*)info;

@end
