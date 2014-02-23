#import "_ExerciseSet.h"

@interface ExerciseSet : _ExerciseSet {}

+ (ExerciseSet*) exerciseSetWithBeacon:(CLBeacon*)beacon;
+ (ExerciseSet*) exerciseSetWithName:(NSString*)name;
- (void) finishExerciseSet;

@end
