#import "ExerciseSet.h"
#import "WorkoutManager.h"
#import "KiwiMoveManager.h"


@interface ExerciseSet ()

// Private interface goes here.

@end


@implementation ExerciseSet

+ (ExerciseSet*) exerciseSetWithBeacon:(CLBeacon*)beacon
{
    ExerciseSet* exerciseSet = [self exerciseSetWithName:[[WorkoutManager sharedManager] exerciseNameForBeacon:beacon]];
    return exerciseSet;
}

+ (ExerciseSet*) exerciseSetWithName:(NSString*)name
{
    ExerciseSet* exerciseSet = [ExerciseSet MR_createEntity];
    exerciseSet.startExercise = [NSDate date];
    exerciseSet.endExercise = [NSDate date];
    exerciseSet.exerciseName = name;
    return exerciseSet;
}

- (void) finishExerciseSet
{
    self.endExercise = [NSDate date];
    self.repetitions = [NSNumber numberWithInt:[KiwiMoveManager sharedManager].reps];
}

@end
