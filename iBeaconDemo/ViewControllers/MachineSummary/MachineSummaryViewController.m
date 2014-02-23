//
//  MachineSummaryViewController.m
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 napathon. All rights reserved.
//

#import "MachineSummaryViewController.h"

@interface MachineSummaryViewController ()

@end

@implementation MachineSummaryViewController

@synthesize machineSummaryView = _machineSummaryView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


#pragma mark - View Lifecycle Methods


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Machine Summary";
	_machineSummaryView = [[MachineSummaryView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_machineSummaryView];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Add the location update notification observer
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleLocationUpdate:)
                                                 name:kLocationUpdateNotification
                                               object:nil];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // Remove the location update notification observer
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kLocationUpdateNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Location Update Notification Methods


- (void)handleLocationUpdate:(NSNotification*)notification
{
    // update status message displayed
    _machineSummaryView.machineNameLabel.text = notification.userInfo[@"status"];
    
    NSDictionary* beaconInfo = notification.userInfo[@"beaconInfo"];
    NSArray* beacons = [beaconInfo objectForKey:@"beacons"];
    CLBeacon* beacon = [beaconInfo objectForKey:@"closestBeacon"];
    
    // log message for debugging
    NSLog(@"%@", notification.userInfo[@"status"]);
}


@end
