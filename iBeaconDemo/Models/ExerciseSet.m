#import "ExerciseSet.h"
#import "WorkoutManager.h"


@interface ExerciseSet ()

// Private interface goes here.

@end


@implementation ExerciseSet

+ (ExerciseSet*) exerciseSetWithBeacon:(CLBeacon*)beacon
{
    ExerciseSet* exerciseSet = [ExerciseSet MR_createEntity];
    exerciseSet.exerciseName = [[WorkoutManager sharedManager] exerciseNameForBeacon:beacon];
    exerciseSet.startExercise = [NSDate date];
    
    return exerciseSet;
}

@end
