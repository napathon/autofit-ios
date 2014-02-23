//
//  WorkoutSummaryViewController.m
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 napathon. All rights reserved.
//

#import "WorkoutSummaryViewController.h"
#import "WorkoutManager.h"

@interface WorkoutSummaryViewController ()

@end

@implementation WorkoutSummaryViewController

@synthesize workoutSummaryView =  _workoutSummaryView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Workout Summary";
	_workoutSummaryView = [[WorkoutSummaryView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_workoutSummaryView];
    
    _workoutSummaryView.workoutNameLabel.text = @"Workout Name";
    [self updateWorkoutStatsUI];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Add the location update notification observer
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleLocationUpdate:)
                                                 name:kLocationUpdateNotification
                                               object:nil];
    [self updateWorkoutStatsUI];
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

#pragma mark - UI Methods

- (void) updateWorkoutStatsUI
{
    NSNumber* numberExercise = [[WorkoutManager sharedManager] numberOfExercises];
    if (numberExercise != nil) {
        _workoutSummaryView.workoutCountLabel.text = [numberExercise stringValue];
    }
}


#pragma mark - Location Update Notification Methods


- (void)handleLocationUpdate:(NSNotification*)notification
{
//    // update status message displayed
//    _workoutSummaryView.workoutNameLabel.text = notification.userInfo[@"statusMessage"];
//    
    // log message for debugging
    NSLog(@"%@", notification.userInfo[@"statusMessage"]);
}

#pragma mark - Exercise Notification Handler Methods

- (void)handleExerciseStarted:(NSNotification*)notification
{
    // update status message displayed
    [self updateWorkoutStatsUI];
}

- (void)handleExerciseFinished:(NSNotification*)notification
{
    [self updateWorkoutStatsUI];
}

@end
