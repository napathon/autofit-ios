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

- (void) recordExerciseSetForBeacon:(CLBeacon*)closestBeacon
{
    // No exercise was being recorded
    if (_currentExerciseSet == nil) {
        _currentExerciseSet = [ExerciseSet exerciseSetWithBeacon:closestBeacon];
    }
    // Exercise was already being recorded
    else {
        NSString* currentExerciseName = _currentExerciseSet.exerciseName;
        NSString* currentBeaconName = [self exerciseNameForBeacon:closestBeacon];
        
        // If we are in the same exercise region continue to just record
        if ([currentBeaconName compare:currentExerciseName] == NSOrderedSame) {
            // Don't do anything, we are still in the same beacon's range
        }
        // Otherwise stop recording and save, start recording new exercise info
        else {
            // TODO: Finish recording the current exercise / beacon's information
            _currentExerciseSet = [ExerciseSet exerciseSetWithBeacon:closestBeacon];
        }
    }
}

- (void) finishRecordingExerciseSet
{
    if (_currentExerciseSet == nil) {
        return;
    } else {
        [_currentExerciseSet finishExerciseSet];
        _currentExerciseSet = nil;
    }
}

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
