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

@property (strong, nonatomic) UILabel* workoutNameLabel;
@property (strong, nonatomic) UILabel* workoutCountLabel;
@property (strong, nonatomic) UILabel* workoutCaloriesBurned;
@property (strong, nonatomic) UILabel* workoutTimeElapsed;

@property (strong, nonatomic) UIButton* clearWorkoutStats;

- (FBBitmapFontView*)setupBitmapFontViewWithFrame:(CGRect)frame;

@end
