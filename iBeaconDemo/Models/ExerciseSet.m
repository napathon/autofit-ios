#import "ExerciseSet.h"


@interface ExerciseSet ()

// Private interface goes here.

@end


@implementation ExerciseSet

+ (ExerciseSet*) exerciseSetWithBeacon:(CLBeacon*)beacon
{
    ExerciseSet* exerciseSet = [ExerciseSet MR_createEntity];
    exerciseSet.exerciseName = [exerciseSet exerciseNameForBeacon:beacon];
    exerciseSet.startExercise = [NSDate date];
    
    return exerciseSet;
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

@end
