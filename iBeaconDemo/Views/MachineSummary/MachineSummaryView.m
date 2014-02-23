//
//  MachineSummaryView.m
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 napathon. All rights reserved.
//

#import "MachineSummaryView.h"

@implementation MachineSummaryView

@synthesize machineNameLabel = _machineNameLabel;
@synthesize startTimeLabel = _startTimeLabel;
@synthesize endTimeLabel = _endTimeLabel;
@synthesize elapsedTimeLabel = _elapsedTimeLabel;
@synthesize caloriesBurnedLabel = _caloriesBurnedLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _machineNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 50.0, 250.0, 50.0)];
        [self addSubview:_machineNameLabel];
        
        _startTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 100.0, 250.0, 50.0)];
        [self addSubview:_startTimeLabel];
        
        _endTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 150.0, 250.0, 50.0)];
        [self addSubview:_endTimeLabel];
        
        _elapsedTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 200.0, 250.0, 50.0)];
        [self addSubview:_elapsedTimeLabel];
        
        _caloriesBurnedLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 250.0, 300.0, 50.0)];
        [self addSubview:_caloriesBurnedLabel];
    }
    return self;
}

//- (void) layoutSubviews
//{
//    _machineNameLabel.frame = CGRectMake(20.0, 20.0, 300.0, 50.0);
//    _startTimeLabel.frame = CGRectMake(20.0, 70.0, 300.0, 50.0);
//    _endTimeLabel.frame = CGRectMake(20.0, 130.0, 300.0, 50.0);
//    _caloriesBurnedLabel.frame = CGRectMake(20.0, 180.0, 300.0, 50.0);
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
