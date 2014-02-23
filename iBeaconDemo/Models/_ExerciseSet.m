// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ExerciseSet.m instead.

#import "_ExerciseSet.h"

const struct ExerciseSetAttributes ExerciseSetAttributes = {
	.endExercise = @"endExercise",
	.exerciseName = @"exerciseName",
	.repetitions = @"repetitions",
	.startExercise = @"startExercise",
};

const struct ExerciseSetRelationships ExerciseSetRelationships = {
	.workout = @"workout",
};

const struct ExerciseSetFetchedProperties ExerciseSetFetchedProperties = {
};

@implementation ExerciseSetID
@end

@implementation _ExerciseSet

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ExerciseSet" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ExerciseSet";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ExerciseSet" inManagedObjectContext:moc_];
}

- (ExerciseSetID*)objectID {
	return (ExerciseSetID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"repetitionsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"repetitions"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic endExercise;






@dynamic exerciseName;






@dynamic repetitions;



- (int16_t)repetitionsValue {
	NSNumber *result = [self repetitions];
	return [result shortValue];
}

- (void)setRepetitionsValue:(int16_t)value_ {
	[self setRepetitions:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRepetitionsValue {
	NSNumber *result = [self primitiveRepetitions];
	return [result shortValue];
}

- (void)setPrimitiveRepetitionsValue:(int16_t)value_ {
	[self setPrimitiveRepetitions:[NSNumber numberWithShort:value_]];
}





@dynamic startExercise;






@dynamic workout;

	






@end
