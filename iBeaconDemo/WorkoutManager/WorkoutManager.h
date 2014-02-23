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

- (void) startExerciseSetForBeacon:(CLBeacon*)closestBeacon;
- (void) startExerciseSetWithName:(NSString*)name;

- (void) finishRecordingExerciseSet;

- (NSString*) exerciseNameForBeacon:(CLBeacon*)beacon;


#pragma mark - Workout Statistics Methods

- (NSNumber*) numberOfExercises;

#pragma mark - NSNotification Methods

- (void)fireWorkoutStartedNotificationWithBeacon:(CLBeacon*)beacon;
- (void)fireWorkoutStartedNotificationWithExerciseName:(NSString*)name;
- (void)fireWorkoutFinishedNotificationWithBeacon:(CLBeacon*)beacon;
- (void)fireWorkoutFinishedNotificationWithExerciseName:(NSString*)name;


@end
