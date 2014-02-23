//
//  WorkoutManagerUnitTests.m
//  hackathon
//
//  Created by nazbot on 2/23/2014.
//  Copyright (c) 2014 Christopher Mann. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WorkoutManager.h"
#import <CoreLocation/CoreLocation.h>
#import <MagicalRecord/MagicalRecord.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>

@interface WorkoutManagerUnitTests : XCTestCase

@end

@implementation WorkoutManagerUnitTests

- (void)setUp
{
    [super setUp];
    [ExerciseSet MR_truncateAll];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testStartExercise
{
    // Start a new exercise
    [[WorkoutManager sharedManager] startExerciseSetWithName:@"Test Exercise"];
    XCTAssertTrue([[[WorkoutManager sharedManager] numberOfExercises] intValue] == 1, @"Should have one exercise");
    
    // Continue with the same exercise
    [[WorkoutManager sharedManager] startExerciseSetWithName:@"Test Exercise"];
    XCTAssertTrue([[[WorkoutManager sharedManager] numberOfExercises] intValue] == 1, @"Should have one exercise");
    
    // Start a new exercise
    [[WorkoutManager sharedManager] startExerciseSetWithName:@"Test Exercise 2"];
    XCTAssertTrue([[[WorkoutManager sharedManager] numberOfExercises] intValue] == 2, @"Should have one exercise");
}

- (void)testStopExercise
{
    // Start a new exercise
    [[WorkoutManager sharedManager] startExerciseSetWithName:@"Test Exercise"];
    XCTAssertTrue([[[WorkoutManager sharedManager] numberOfExercises] intValue] == 1, @"Should have one exercise");
    XCTAssertTrue([WorkoutManager sharedManager].currentExerciseSet != nil, @"Current exercise should be nil");
    
    // Finish the current exercise
    [[WorkoutManager sharedManager] finishRecordingExerciseSet];
    
    XCTAssertTrue([[[WorkoutManager sharedManager] numberOfExercises] intValue] == 1, @"Should have one exercise");
    XCTAssertTrue([WorkoutManager sharedManager].currentExerciseSet == nil, @"Current exercise should be nil");
}

@end
