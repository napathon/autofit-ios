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
    exerciseSet.endExercise = [NSDate date];
    
    return exerciseSet;
}

- (void) finishExerciseSet
{
    self.endExercise = [NSDate date];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

@end
