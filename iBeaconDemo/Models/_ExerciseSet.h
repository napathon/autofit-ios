// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ExerciseSet.h instead.

#import <CoreData/CoreData.h>


extern const struct ExerciseSetAttributes {
	__unsafe_unretained NSString *endExercise;
	__unsafe_unretained NSString *exerciseName;
	__unsafe_unretained NSString *repetitions;
	__unsafe_unretained NSString *startExercise;
} ExerciseSetAttributes;

extern const struct ExerciseSetRelationships {
	__unsafe_unretained NSString *workout;
} ExerciseSetRelationships;

extern const struct ExerciseSetFetchedProperties {
} ExerciseSetFetchedProperties;

@class Workout;






@interface ExerciseSetID : NSManagedObjectID {}
@end

@interface _ExerciseSet : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ExerciseSetID*)objectID;





@property (nonatomic, strong) NSDate* endExercise;



//- (BOOL)validateEndExercise:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* exerciseName;



//- (BOOL)validateExerciseName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* repetitions;



@property int16_t repetitionsValue;
- (int16_t)repetitionsValue;
- (void)setRepetitionsValue:(int16_t)value_;

//- (BOOL)validateRepetitions:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startExercise;



//- (BOOL)validateStartExercise:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Workout *workout;

//- (BOOL)validateWorkout:(id*)value_ error:(NSError**)error_;





@end

@interface _ExerciseSet (CoreDataGeneratedAccessors)

@end

@interface _ExerciseSet (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveEndExercise;
- (void)setPrimitiveEndExercise:(NSDate*)value;




- (NSString*)primitiveExerciseName;
- (void)setPrimitiveExerciseName:(NSString*)value;




- (NSNumber*)primitiveRepetitions;
- (void)setPrimitiveRepetitions:(NSNumber*)value;

- (int16_t)primitiveRepetitionsValue;
- (void)setPrimitiveRepetitionsValue:(int16_t)value_;




- (NSDate*)primitiveStartExercise;
- (void)setPrimitiveStartExercise:(NSDate*)value;





- (Workout*)primitiveWorkout;
- (void)setPrimitiveWorkout:(Workout*)value;


@end
