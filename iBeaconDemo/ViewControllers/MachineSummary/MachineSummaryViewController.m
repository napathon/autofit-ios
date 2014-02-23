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
}

- (void) updateUIWithName:(NSString*)currentExerciseName withStartTime:(NSDate*)startTime
{
    // Current ex name
    _machineSummaryView.machineNameLabel.text = currentExerciseName;
    
    // Elapsed Time
    NSTimeInterval elapsedTime = [[WorkoutManager sharedManager] timeIntervalForStartTime:startTime];
    NSString* elapsedTimeString = [NSString stringWithFormat:@"Elapsed Time: %f", elapsedTime];
    _machineSummaryView.elapsedTimeLabel.text = elapsedTimeString;
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

- (void)handleExerciseFinished:(NSNotification*)notification
{
    _machineSummaryView.machineNameLabel.text = @"Not currently exercising";
}


@end
