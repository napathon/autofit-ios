#import "_ExerciseSet.h"

@interface ExerciseSet : _ExerciseSet {}

+ (ExerciseSet*) exerciseSetWithBeacon:(CLBeacon*)beacon;
- (NSString*) exerciseNameForBeacon:(CLBeacon*)beacon;

@end
