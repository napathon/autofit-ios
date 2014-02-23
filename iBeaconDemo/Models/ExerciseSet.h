#import "_ExerciseSet.h"

@interface ExerciseSet : _ExerciseSet {}

+ (ExerciseSet*) exerciseSetWithBeacon:(CLBeacon*)beacon;
- (void) finishExerciseSet;

@end
