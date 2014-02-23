//
//  MachineSummaryViewController.m
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 napathon. All rights reserved.
//

#import "MachineSummaryViewController.h"
#import "WorkoutManager.h"

@interface MachineSummaryViewController ()

@end

@implementation MachineSummaryViewController

@synthesize machineSummaryView = _machineSummaryView;
@synthesize updateUITimer = _updateUITimer;

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleRepCompleted:)
                                                 name:kRepCompletedNotification
                                               object:nil];
    
    _updateUITimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(updateUI)
                                   userInfo:nil
                                    repeats:YES];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // Remove the location update notification observer
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kLocationUpdateNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kWorkoutStartedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kWorkoutFinishedNotification object:nil];
    
    // Stop the timer
    [_updateUITimer invalidate];
    _updateUITimer = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Methods

- (void) updateUI
{
    [self updateUIWithName:[[WorkoutManager sharedManager] currentExerciseName] withStartTime:[[WorkoutManager sharedManager] currentExerciseStartTime]];
    [_machineSummaryView resetSizes];
}

- (void) updateUIWithName:(NSString*)currentExerciseName withStartTime:(NSDate*)startTime
{
    // Update Exercise name
    _machineSummaryView.machineNameLabel.text = currentExerciseName;
    
    // Update Elapsed Time
    NSTimeInterval elapsedTime = [[WorkoutManager sharedManager] timeIntervalForStartTime:startTime];
    _machineSummaryView.elapsedTimeCounterLabel.text = [NSString stringWithFormat:@"%f", elapsedTime];
}


#pragma mark - Location Update Notification Methods


- (void)handleLocationUpdate:(NSNotification*)notification
{
//    // update status message displayed
//    _machineSummaryView.machineNameLabel.text = notification.userInfo[@"statusMessage"];
//    
    // log message for debugging
    NSLog(@"%@", notification.userInfo[@"statusMessage"]);
}

#pragma mark - Exercise Notification Handler Methods

- (void)handleExerciseStarted:(NSNotification*)notification
{
    // update status message displayed
    NSString* currentExerciseName = notification.userInfo[@"exerciseName"];
    _machineSummaryView.machineNameLabel.text = [NSString stringWithFormat:@"Currently doing %@", currentExerciseName];
}

- (void)handleRepCompleted:(NSNotification*)notification
{
    // update status message displayed
    NSNumber* currentReps = notification.userInfo[@"repNum"];
}

- (void)handleExerciseFinished:(NSNotification*)notification
{
    _machineSummaryView.machineNameLabel.text = @"Not currently exercising";
}


@end
