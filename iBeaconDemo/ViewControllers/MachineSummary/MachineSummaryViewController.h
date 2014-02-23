//
//  MachineSummaryViewController.h
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 napathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MachineSummaryView.h"
#import "ExerciseSet.h"

@interface MachineSummaryViewController : UIViewController

@property (strong, nonatomic) MachineSummaryView* machineSummaryView;
@property (strong, nonatomic) NSTimer* updateUITimer;

- (void) updateUI;
- (void) updateUIWithName:(NSString*)currentExerciseName withStartTime:(NSDate*)startTime;

@end
