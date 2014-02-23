//
//  CSMRootViewController.m
//  iBeacons_Demo
//
//  Created by napathon on 9/5/13.
//  Copyright (c) 2013 napathon. All rights reserved.
//

#import "HackathonRootViewController.h"
#import "HackathonHomeViewController.h"

@interface HackathonRootViewController ()

@property (nonatomic, strong) HackathonHomeViewController  *homeController;
@property (nonatomic, strong) UINavigationController *navController;

@end

@implementation HackathonRootViewController

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // add home controller
    self.homeController = [[HackathonHomeViewController alloc] init];
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.homeController];
    
    [self addChildViewController:self.navController];
    self.navController.view.frame = self.view.frame;
    [self.view addSubview:self.navController.view];
    [self.navController didMoveToParentViewController:self];
}

@end
