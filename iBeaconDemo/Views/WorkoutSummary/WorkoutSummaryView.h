//
//  WorkoutSummaryView.h
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 napathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBDigitalFont/FBBitmapFontView.h>

@interface WorkoutSummaryView : UIView

@property (strong, nonatomic) FBBitmapFontView* workoutNameLabel;
@property (strong, nonatomic) FBBitmapFontView* workoutCountLabel;
@property (strong, nonatomic) FBBitmapFontView* workoutCaloriesBurned;
@property (strong, nonatomic) FBBitmapFontView* workoutTimeElapsed;

@property (strong, nonatomic) UIButton* clearWorkoutStats;

- (FBBitmapFontView*)setupBitmapFontViewWithFrame:(CGRect)frame;
- (void) resetSizes;

@end
