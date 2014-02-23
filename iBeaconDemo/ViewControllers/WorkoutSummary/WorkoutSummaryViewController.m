//
//  WorkoutSummaryViewController.m
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 napathon. All rights reserved.
//

#import "WorkoutSummaryViewController.h"

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
	_workoutSummaryView = [WorkoutSummaryView new];
    self.view = _workoutSummaryView;
    
    _workoutSummaryView.workoutNameLabel.text = @"Workout Name";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
