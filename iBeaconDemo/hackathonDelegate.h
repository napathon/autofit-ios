//
//  CSMAppDelegate.h
//  iBeacons_Demo
//
//  Created by napathon on 9/5/13.
//  Copyright (c) 2013 napathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HackathonRootViewController.h"

typedef NS_ENUM(NSUInteger, CSMApplicationMode) {
    CSMApplicationModePeripheral = 0,
    CSMApplicationModeRegionMonitoring
};

#define kUniqueRegionIdentifier @"iBeacon Demo"

#define kAppTintColor [UIColor colorWithRed:0.12 green:0.50 blue:0.15 alpha:1.0]


@interface hackathonDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) HackathonRootViewController *rootViewController;

@property (nonatomic, strong) NSUUID *myUUID;

@property (nonatomic, assign) CSMApplicationMode applicationMode;

+ (hackathonDelegate*)appDelegate;

@end
