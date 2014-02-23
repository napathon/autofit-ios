// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Workout.h instead.

#import <CoreData/CoreData.h>


extern const struct WorkoutAttributes {
	__unsafe_unretained NSString *endWorkout;
	__unsafe_unretained NSString *startWorkout;
} WorkoutAttributes;

extern const struct WorkoutRelationships {
	__unsafe_unretained NSString *exerciseSets;
} WorkoutRelationships;

extern const struct WorkoutFetchedProperties {
} WorkoutFetchedProperties;

@class ExerciseSet;




@interface WorkoutID : NSManagedObjectID {}
@end

@interface _Workout : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (WorkoutID*)objectID;





@property (nonatomic, strong) NSDate* endWorkout;



//- (BOOL)validateEndWorkout:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startWorkout;



//- (BOOL)validateStartWorkout:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) ExerciseSet *exerciseSets;

//- (BOOL)validateExerciseSets:(id*)value_ error:(NSError**)error_;





@end

@interface _Workout (CoreDataGeneratedAccessors)

@end

@interface _Workout (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveEndWorkout;
- (void)setPrimitiveEndWorkout:(NSDate*)value;




- (NSDate*)primitiveStartWorkout;
- (void)setPrimitiveStartWorkout:(NSDate*)value;





- (ExerciseSet*)primitiveExerciseSets;
- (void)setPrimitiveExerciseSets:(ExerciseSet*)value;


@end
