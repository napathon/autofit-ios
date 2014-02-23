//
//  MachineSummaryView.h
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 napathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBDigitalFont/FBBitmapFontView.h>


@interface MachineSummaryView : UIView

@property (strong, nonatomic) FBBitmapFontView* machineNameTitleLabel;
@property (strong, nonatomic) FBBitmapFontView* machineNameLabel;

@property (strong, nonatomic) FBBitmapFontView* startTimeLabel;
@property (strong, nonatomic) FBBitmapFontView* endTimeLabel;

@property (strong, nonatomic) FBBitmapFontView* elapsedTimeLabel;
@property (strong, nonatomic) FBBitmapFontView* elapsedTimeCounterLabel;

@property (strong, nonatomic) FBBitmapFontView* caloriesBurnedLabel;
@property (strong, nonatomic) FBBitmapFontView* caloriesBurnedCounterLabel;

- (FBBitmapFontView*)setupBitmapFontViewWithFrame:(CGRect)frame;
- (void) resetSizes;

@end
