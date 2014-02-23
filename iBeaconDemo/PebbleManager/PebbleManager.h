//
//  PebbleManager.h
//  hackathon
//
//  Created by bgraner on 2/23/2014.
//  Copyright (c) 2014 Napathon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ExerciseSet.h"
#import "WorkoutManager.h"

@interface PebbleManager : NSObject

+ (instancetype)sharedManager;

#pragma mark - Pebble Methods

- (void) updatePebbleStartExercise:(ExerciseSet*)exercise;
- (void) updatePebbleFinishedExercise:(ExerciseSet*)exercise;
- (void) postLocalNotificationWithText:(NSString*)body;

@end
