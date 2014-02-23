//
//  CSMAppDelegate.m
//  iBeacons_Demo
//
//  Created by napathon on 9/5/13.
//  Copyright (c) 2013 napathon. All rights reserved.
//

#import "hackathonDelegate.h"
#import "HackLocationManager.h"
#import "KiwiMoveManager.h"

#define kMyStoreNumber 1
#define kWeeklySpecialItemNumber 1


@implementation hackathonDelegate

+ (hackathonDelegate*)appDelegate {
    return (hackathonDelegate*)[UIApplication sharedApplication].delegate;
}

- (NSUUID*)myUUID {
    if (!_myUUID) {
        // generate unique identifier
        _myUUID = [[NSUUID alloc] initWithUUIDString:@"8deefbb9-f738-4297-8040-96668bb44281"];
    }
    return _myUUID;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.rootViewController = [[HackathonRootViewController alloc] init];
 
    // define navbar appearance
    [[UINavigationBar appearance] setBarTintColor:kAppTintColor];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
    // set status bar style
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.rootViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.tintColor = kAppTintColor;
    [self.window makeKeyAndVisible];
    
    // Always set to region monitoring
    self.applicationMode = CSMApplicationModeRegionMonitoring;
    
    // Start iBeacon Ranging
    [[HackLocationManager sharedManager] initializeRegionMonitoring];
    [[KiwiMoveManager sharedManager] connect];
    
    // Set up Core Data Stack
    [MagicalRecord setupAutoMigratingCoreDataStack];
    
    return YES;
}

@end
