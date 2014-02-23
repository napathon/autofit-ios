//
//  WorkoutSummaryView.m
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 napathon. All rights reserved.
//

#import "WorkoutSummaryView.h"

@implementation WorkoutSummaryView

@synthesize workoutNameLabel = _workoutNameLabel;
@synthesize workoutCountLabel = _workoutCountLabel;
@synthesize workoutCaloriesBurned = _workoutCaloriesBurned;
@synthesize workoutTimeElapsed = _workoutTimeElapsed;

@synthesize clearWorkoutStats = _clearWorkoutStats;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _workoutNameLabel = [self setupBitmapFontViewWithFrame:CGRectMake(20.0, 100.0, 250.0, 50.0)];
        _workoutNameLabel.text = @"Workout Stats";
        [self addSubview:_workoutNameLabel];
        
        _workoutCountLabel = [self setupBitmapFontViewWithFrame:CGRectMake(20.0, 200.0, 250.0, 50.0)];
        _workoutCountLabel.text = @"0";
        [self addSubview:_workoutCountLabel];
        
        _workoutCaloriesBurned = [self setupBitmapFontViewWithFrame:CGRectMake(20.0, 300.0, 250.0, 50.0)];
        _workoutCaloriesBurned.text = @"0";
        //[self addSubview:_workoutCaloriesBurned];
        
        _workoutTimeElapsed = [self setupBitmapFontViewWithFrame:CGRectMake(20.0, 400.0, 250.0, 50.0)];
        _workoutTimeElapsed.text = @"0";
        //[self addSubview:_workoutTimeElapsed];
        
        _clearWorkoutStats = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _clearWorkoutStats.frame = CGRectMake(20.0, 300.0, 250.0, 50.0);
        [_clearWorkoutStats setTitle:@"Reset Stats" forState:UIControlStateNormal];
        //[self addSubview:_clearWorkoutStats];
        
        [self resetSizes];
        
        // Set background color
        self.backgroundColor = [UIColor blackColor];
        
    }
    return self;
}

- (FBBitmapFontView*)setupBitmapFontViewWithFrame:(CGRect)frame
{
    FBBitmapFontView *v = [[FBBitmapFontView alloc] initWithFrame:frame];
    v.text = @"BITMAP";
    v.numberOfBottomPaddingDot = 1;
    v.numberOfTopPaddingDot    = 1;
    v.numberOfLeftPaddingDot   = 2;
    v.numberOfRightPaddingDot  = 2;
    v.glowSize = 20.0;
    v.innerGlowSize = 3.0;
    v.edgeLength = 1.5;
    return v;
    [v resetSize];
}

- (void) resetSizes
{
    [_workoutNameLabel resetSize];
    [_workoutCountLabel resetSize];
    //[_workoutCaloriesBurned resetSize];
    //[_workoutTimeElapsed resetSize];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
