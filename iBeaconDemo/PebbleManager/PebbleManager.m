//
//  PebbleManager.m
//  hackathon
//
//  Created by bgraner on 2/23/2014.
//  Copyright (c) 2014 Napathon. All rights reserved.
//

#import "PebbleManager.h"

static PebbleManager *_sharedInstance = nil;

@implementation PebbleManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[PebbleManager alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - Pebble Methods


- (void) updatePebbleStartExercise:(ExerciseSet*)exercise
{
    [self postLocalNotificationWithText:[NSString stringWithFormat:@"Starting %@", exercise.exerciseName]];
}

// TODO: Move to Pebble Manager
- (void) updatePebbleFinishedExercise:(ExerciseSet*)exercise
{
    // Update the Pebble
    [self postLocalNotificationWithText:[NSString stringWithFormat:@"Finished %@", exercise.exerciseName]];
}

- (void) postLocalNotificationWithText:(NSString*)body
{
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = [NSDate date];
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
	// Notification details
    localNotif.alertBody = body;
	// Set the action button
    localNotif.alertAction = @"View";
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    
    // Do the local notification
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

@end
