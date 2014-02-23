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
        _workoutNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 50.0, 250.0, 50.0)];
        [self addSubview:_workoutNameLabel];
        
        _workoutCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 100.0, 250.0, 50.0)];
        [self addSubview:_workoutCountLabel];
        
        _workoutCaloriesBurned = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 150.0, 250.0, 50.0)];
        [self addSubview:_workoutCaloriesBurned];
        
        _workoutTimeElapsed = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 200.0, 250.0, 50.0)];
        [self addSubview:_workoutTimeElapsed];
        
        _clearWorkoutStats = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _clearWorkoutStats.frame = CGRectMake(20.0, 250.0, 250.0, 50.0);
        [self addSubview:_clearWorkoutStats];
        
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
    v.edgeLength = 2.0;
    return v;
    [v resetSize];
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
