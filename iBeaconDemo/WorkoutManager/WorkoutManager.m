//
//  WorkoutManager.m
//  hackathon
//
//  Created by nazbot on 2/22/2014.
//  Copyright (c) 2014 Christopher Mann. All rights reserved.
//

#import "WorkoutManager.h"

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
    // No exercise was being recorded
    if (_currentExerciseSet == nil) {
        _currentExerciseSet = [ExerciseSet exerciseSetWithName:name];
        [self updatePebbleStartExercise:_currentExerciseSet];
    }
    // Exercise was already being recorded
    else {
        NSString* currentExerciseName = _currentExerciseSet.exerciseName;
        
        // If we are in the same exercise region continue to just record
        if ([name compare:currentExerciseName] == NSOrderedSame) {
            // Don't do anything, we are still doing the same exercise
        }
        // Otherwise stop recording and save, start recording new exercise info
        else {
            // TODO: Finish recording the current exercise / beacon's information
            _currentExerciseSet = [ExerciseSet exerciseSetWithName:name];
            [self updatePebbleStartExercise:_currentExerciseSet];
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
        [_currentExerciseSet finishExerciseSet];
        
        // Update the Pebble
        [self updatePebbleFinishedExercise:_currentExerciseSet];
        _currentExerciseSet = nil;
    }
}


#pragma mark - Pebble Methods


- (void) updatePebbleStartExercise:(ExerciseSet*)exercise
{
    [self postLocalNotificationWithText:[NSString stringWithFormat:@"Starting %@", exercise.exerciseName]];
}

// TODO: Move to Pebble Manager
- (void) updatePebbleFinishedExercise:(ExerciseSet*)exercise
{
    // Update the Pebble
    [self postLocalNotificationWithText:[NSString stringWithFormat:@"Finished %@", exercise.exerciseName]];
}

- (void) postLocalNotificationWithText:(NSString*)body
{
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = [NSDate date];
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
	// Notification details
    localNotif.alertBody = body;
	// Set the action button
    localNotif.alertAction = @"View";
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    
    // Do the local notification
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}


#pragma mark - Exercise Convenience Methods


- (NSString*) exerciseNameForBeacon:(CLBeacon*)beacon
{
    if (beacon == nil) {
        return nil;
    }
    
    // We only need to use the minor numbers
    NSString* exerciseName = @"";
    if ([beacon.minor compare:[NSNumber numberWithInt:237]] == NSOrderedSame) {
        exerciseName = @"Treadmill";
    } else if ([beacon.minor compare:[NSNumber numberWithInt:237]] == NSOrderedSame) {
        exerciseName = @"Shoulder Press";
    }
    return exerciseName;
}

#pragma mark - Workout Statistics Methods

- (NSNumber*) numberOfExercises
{
    return [NSNumber numberWithInt:[ExerciseSet MR_countOfEntities]];
}

@end
