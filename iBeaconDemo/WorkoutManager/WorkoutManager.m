//
//  WorkoutManager.m
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 Napathon. All rights reserved.
//

#import "WorkoutManager.h"
#import "PebbleManager.h"

static WorkoutManager *_sharedInstance = nil;

@implementation WorkoutManager

@synthesize currentExerciseSet = _currentExerciseSet;

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[WorkoutManager alloc] init];
    });
    return _sharedInstance;
}

- (void) startExerciseSetForBeacon:(CLBeacon*)closestBeacon
{
    if (closestBeacon != nil) {
        [self startExerciseSetWithName:[self exerciseNameForBeacon:closestBeacon]];
    }
}

- (void) startExerciseSetWithName:(NSString*)name
{
    if (_currentExerciseSet == nil) {
        // No exercise was being recorded
        _currentExerciseSet = [ExerciseSet exerciseSetWithName:name];
        [self fireWorkoutStartedNotificationWithExerciseName:name];
        [[PebbleManager sharedManager] updatePebbleStartExercise:_currentExerciseSet];
    } else {
        // Exercise was already being recorded
        NSString* currentExerciseName = _currentExerciseSet.exerciseName;
        
        if ([name compare:currentExerciseName] == NSOrderedSame) {
            // If we are in the same exercise region continue to just record
            // Don't do anything, we are still doing the same exercise
        } else {
        // Otherwise stop recording and save, start recording new exercise info
            // Finished recording current exercise
            [self finishRecordingExerciseSet];
            
            // Start recording new exercise
            _currentExerciseSet = [ExerciseSet exerciseSetWithName:name];
            [self fireWorkoutStartedNotificationWithExerciseName:name];
            [[PebbleManager sharedManager] updatePebbleStartExercise:_currentExerciseSet];
        }
    }
}

- (void) finishRecordingExerciseSet
{
    [self finishRecordingExerciseSetWithNotification:NO];
}

- (void) finishRecordingExerciseSetWithNotification:(BOOL)bNotification
{
    if (_currentExerciseSet == nil) {
        return;
    } else {
        // Update listening controllers
        [self fireWorkoutFinishedNotificationWithExerciseName:_currentExerciseSet.exerciseName];
        [_currentExerciseSet finishExerciseSet];
        
        // Update the Pebble
        [[PebbleManager sharedManager] updatePebbleFinishedExercise:_currentExerciseSet];
        _currentExerciseSet = nil;
    }
}


#pragma mark - Exercise Convenience Methods


- (NSString*) exerciseNameForBeacon:(CLBeacon*)beacon
{
    if (beacon == nil) {
        return nil;
    }
    
    // We only need to use the minor numbers
    NSString* exerciseName = @"";
    if ([beacon.minor compare:[NSNumber numberWithInt:2137]] == NSOrderedSame) {
        exerciseName = @"Treadmill";
    } else if ([beacon.minor compare:[NSNumber numberWithInt:2134]] == NSOrderedSame) {
        exerciseName = @"Shoulder Press";
    }
    return exerciseName;
}

#pragma mark - Current Workout Methods

- (BOOL) isExercising
{
    return (_currentExerciseSet != nil);
}

- (NSString*) currentExerciseName
{
    if (_currentExerciseSet != nil) {
        return _currentExerciseSet.exerciseName;
    }
    return @"";
}

- (NSDate*) currentExerciseStartTime
{
    if (_currentExerciseSet != nil) {
        return _currentExerciseSet.startExercise;
    }
    return nil;
}

- (NSTimeInterval) timeIntervalForStartTime:(NSDate*)startTime
{
    NSDate* currentTime = [NSDate date];
    if (startTime != nil) {
        return [currentTime timeIntervalSinceDate:startTime];
    }
    return 0;
}

- (NSTimeInterval) timeIntervalSinceExerciseStarted
{
    if (_currentExerciseSet != nil) {
        return [self timeIntervalForStartTime:_currentExerciseSet.startExercise];
    }
    return 0;
}

#pragma mark - Workout Statistics Methods

- (NSNumber*) numberOfExercises
{
    return [NSNumber numberWithInt:[ExerciseSet MR_countOfEntities]];
}

- (void) clearAllExerciseStats
{
    [ExerciseSet MR_truncateAll];
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
}

#pragma mark - NSNotification Methods

- (void)fireWorkoutStartedNotificationWithBeacon:(CLBeacon*)beacon
{
    NSString* exerciseName = [self exerciseNameForBeacon:beacon];
    [self fireWorkoutStartedNotificationWithExerciseName:exerciseName];
}

- (void)fireWorkoutStartedNotificationWithExerciseName:(NSString*)name
{
    // fire notification to update displayed status
    [[NSNotificationCenter defaultCenter] postNotificationName:kWorkoutStartedNotification
                                                        object:Nil
                                                      userInfo:@{@"exerciseName" : name
                                                                 }];
}

- (void)fireWorkoutFinishedNotificationWithBeacon:(CLBeacon*)beacon
{
    NSString* exerciseName = [self exerciseNameForBeacon:beacon];
    [self fireWorkoutStartedNotificationWithExerciseName:exerciseName];
}

- (void)fireWorkoutFinishedNotificationWithExerciseName:(NSString*)name
{
    // fire notification to update displayed status
    [[NSNotificationCenter defaultCenter] postNotificationName:kWorkoutFinishedNotification
                                                        object:Nil
                                                      userInfo:@{@"exerciseName" : name
                                                                 }];
}


@end
