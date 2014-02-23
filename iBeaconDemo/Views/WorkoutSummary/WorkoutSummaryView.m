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
        
    }
    return self;
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
