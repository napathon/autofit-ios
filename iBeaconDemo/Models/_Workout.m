// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Workout.m instead.

#import "_Workout.h"

const struct WorkoutAttributes WorkoutAttributes = {
	.endWorkout = @"endWorkout",
	.startWorkout = @"startWorkout",
};

const struct WorkoutRelationships WorkoutRelationships = {
	.exerciseSets = @"exerciseSets",
};

const struct WorkoutFetchedProperties WorkoutFetchedProperties = {
};

@implementation WorkoutID
@end

@implementation _Workout

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Workout" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Workout";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Workout" inManagedObjectContext:moc_];
}

- (WorkoutID*)objectID {
	return (WorkoutID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic endWorkout;






@dynamic startWorkout;






@dynamic exerciseSets;

	






@end
