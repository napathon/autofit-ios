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
@synthesize workoutCaloriesBurned = _workoutCaloriesBurned;
@synthesize workoutTimeElapsed = _workoutTimeElapsed;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _workoutNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 20.0, 300.0, 50.0)];
        [self addSubview:_workoutNameLabel];
        
        _workoutCaloriesBurned = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 70.0, 300.0, 50.0)];
        [self addSubview:_workoutCaloriesBurned];
        
        _workoutTimeElapsed = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 130.0, 300.0, 50.0)];
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
