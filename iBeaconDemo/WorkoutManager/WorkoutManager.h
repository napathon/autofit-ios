//
//  WorkoutManager.h
//  hackathon
//
//  Created by nazbot on 2/22/2014.
//  Copyright (c) 2014 Christopher Mann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseSet.h"

@interface WorkoutManager : NSObject

@property (strong, nonatomic) ExerciseSet* currentExerciseSet;

+ (instancetype)sharedManager;
- (void) updateExerciseSetForBeacon:(CLBeacon*)closestBeacon;
- (void) finishRecordingExerciseSet;


@end
