//
//  CSMHomeViewController.m
//  iBeacons_Demo
//
//  Created by napathon on 9/5/13.
//  Copyright (c) 2013 napathon. All rights reserved.
//

#import "HackathonHomeViewController.h"
#import "CSMLocationUpdateController.h"

#import "MachineSummaryViewController.h"
#import "WorkoutSummaryViewController.h"

#import "hackathonDelegate.h"

#import "HackLocationManager.h"

#define kHorizontalPadding 20
#define kVerticalPadding 10

@interface HackathonHomeViewController ()

@property (nonatomic, strong) UILabel            *instructionLabel;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UILabel            *currentWorkoutName;

@end

@implementation HackathonHomeViewController

- (id)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Autofit";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.instructionLabel = [UILabel new];
    self.instructionLabel.textAlignment = NSTextAlignmentCenter;
    self.instructionLabel.preferredMaxLayoutWidth = self.view.frame.size.width - 2*kHorizontalPadding;
    self.instructionLabel.numberOfLines = 0;
    self.instructionLabel.text = @"Do you want to see your current machine stats or full workout stats?";
    self.instructionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.instructionLabel];
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Current Machine",@"Workout Summary"]];
    self.segmentedControl.momentary = YES;
    self.segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.segmentedControl addTarget:self action:@selector(chooseDetailView:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    
    self.currentWorkoutName = [[UILabel alloc] init];
    self.currentWorkoutName.textAlignment = NSTextAlignmentCenter;
    self.currentWorkoutName.preferredMaxLayoutWidth = self.view.frame.size.width - 2*kHorizontalPadding;
    self.currentWorkoutName.numberOfLines = 0;
    self.currentWorkoutName.translatesAutoresizingMaskIntoConstraints = NO;
    self.currentWorkoutName.text = @"Not currently working out";
    [self.view addSubview:self.currentWorkoutName];
    
    
    // define auto layout constraints
    NSDictionary *constraintMetrics = @{@"horizontalPadding" : @kHorizontalPadding,
                                       @"verticalPadding" : @(5*kVerticalPadding),
                                        @"verticalSpacing" : @(2*kVerticalPadding)};
    NSDictionary *constraintViews = @{@"label" : self.instructionLabel,
                                       @"segmentedControl" : self.segmentedControl,
                                      @"currentWorkoutName" : self.currentWorkoutName,
                                      @"topGuide" : self.topLayoutGuide};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-horizontalPadding-[label]-horizontalPadding-|"
                                                                     options:0
                                                                     metrics:constraintMetrics
                                                                        views:constraintViews]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-horizontalPadding-[segmentedControl]-horizontalPadding-|"
                                                                      options:0
                                                                      metrics:constraintMetrics
                                                                        views:constraintViews]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-horizontalPadding-[currentWorkoutName]-horizontalPadding-|"
                                                                      options:0
                                                                      metrics:constraintMetrics
                                                                        views:constraintViews]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topGuide]-verticalPadding-[label]-verticalSpacing-[segmentedControl(==60)]-verticalSpacing-[currentWorkoutName]-(>=verticalPadding)-|"
                                                                      options:0
                                                                      metrics:constraintMetrics
                                                                        views:constraintViews]];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Add the location update notification observer
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleLocationUpdate:)
                                                 name:kLocationUpdateNotification
                                               object:nil];
    
    // Add the location update notification observer
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleExerciseStarted:)
                                                 name:kWorkoutStartedNotification
                                               object:nil];
    
    // Add the location update notification observer
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleExerciseFinished:)
                                                 name:kWorkoutFinishedNotification
                                               object:nil];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // Remove the location update notification observer
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kLocationUpdateNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kWorkoutStartedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kWorkoutFinishedNotification object:nil];
}

- (void)chooseDetailView:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        MachineSummaryViewController* machineSummaryViewController = [[MachineSummaryViewController alloc] init];
        [self.navigationController pushViewController:machineSummaryViewController animated:YES];
    } else {
        WorkoutSummaryViewController* workoutSummaryViewController = [[WorkoutSummaryViewController alloc] init];
        [self.navigationController pushViewController:workoutSummaryViewController animated:YES];
        
    }
}


#pragma mark - iBeacon Monitoring Methods


- (void)enableRegionMonitoringMode {
    
    [[HackLocationManager sharedManager] initializeRegionMonitoring];
    
    self.title = @"Monitoring iBeacons";
}

- (void)handleLocationUpdate:(NSNotification*)notification
{
//    // update status message displayed
//    self.currentWorkoutName.text = notification.userInfo[@"statusMessage"];
//    
//    NSArray* beacons = notification.userInfo[@"beaconArray"];
//    CLBeacon* closestBeacon = notification.userInfo[@"closestBeacon"];
//    
    // log message for debugging
    NSLog(@"%@", notification.userInfo[@"statusMessage"]);
}

#pragma mark - Exercise Notification Handler Methods

- (void)handleExerciseStarted:(NSNotification*)notification
{
    // update status message displayed
    NSString* currentExerciseName = notification.userInfo[@"exerciseName"];
    self.currentWorkoutName.text = [NSString stringWithFormat:@"Currently doin %@", currentExerciseName];
}

- (void)handleExerciseFinished:(NSNotification*)notification
{
    self.currentWorkoutName.text = @"Not currently exercising";
}

@end
