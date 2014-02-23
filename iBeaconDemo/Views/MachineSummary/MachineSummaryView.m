//
//  MachineSummaryView.m
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 napathon. All rights reserved.
//

#import "MachineSummaryView.h"


@implementation MachineSummaryView

@synthesize machineNameTitleLabel = _machineNameTitleLabel;
@synthesize machineNameLabel = _machineNameLabel;

@synthesize startTimeLabel = _startTimeLabel;
@synthesize endTimeLabel = _endTimeLabel;

@synthesize elapsedTimeLabel = _elapsedTimeLabel;
@synthesize elapsedTimeCounterLabel = _elapsedTimeCounterLabel;

@synthesize caloriesBurnedLabel = _caloriesBurnedLabel;
@synthesize caloriesBurnedCounterLabel = _caloriesBurnedCounterLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Machine Name
        _machineNameTitleLabel = [self setupBitmapFontViewWithFrame:CGRectMake(10.0, 100.0, 250.0, 50.0)];
        _machineNameTitleLabel.text = @"Machine Name";
        [self addSubview:_machineNameTitleLabel];
        
        _machineNameLabel = [self setupBitmapFontViewWithFrame:CGRectMake(10.0, 150.0, 250.0, 50.0)];
        _machineNameLabel.text = @"n/a";
        [self addSubview:_machineNameLabel];
        
        
        // Elapsed Time
        _elapsedTimeLabel = [self setupBitmapFontViewWithFrame:CGRectMake(10.0, 225.0, 250.0, 50.0)];
        _elapsedTimeLabel.text = @"Elapsed Time";
        [self addSubview:_elapsedTimeLabel];
        
        _elapsedTimeCounterLabel = [self setupBitmapFontViewWithFrame:CGRectMake(10.0, 275.0, 250.0, 50.0)];
        _caloriesBurnedCounterLabel.text = @"0";
        [self addSubview:_elapsedTimeCounterLabel];
        
        
        // Calories Burned
        _caloriesBurnedLabel = [self setupBitmapFontViewWithFrame:CGRectMake(10.0, 350.0, 250.0, 50.0)];
        _caloriesBurnedLabel.text = @"Calories";
        [self addSubview:_caloriesBurnedLabel];
        
        _caloriesBurnedCounterLabel = [self setupBitmapFontViewWithFrame:CGRectMake(10.0, 400.0, 250.0, 50.0)];
        _caloriesBurnedCounterLabel.text = @"0";
        [self addSubview:_caloriesBurnedCounterLabel];
        
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
    [_machineNameLabel resetSize];
    [_startTimeLabel resetSize];
    [_endTimeLabel resetSize];
    [_elapsedTimeLabel resetSize];
    [_elapsedTimeCounterLabel resetSize];
    [_caloriesBurnedLabel resetSize];
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
