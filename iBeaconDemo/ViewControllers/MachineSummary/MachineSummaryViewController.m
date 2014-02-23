//
//  MachineSummaryViewController.m
//  hackathon
//
//  Created by bgraner on 2/22/2014.
//  Copyright (c) 2014 napathon. All rights reserved.
//

#import "MachineSummaryViewController.h"

@interface MachineSummaryViewController ()

@end

@implementation MachineSummaryViewController

@synthesize machineSummaryView = _machineSummaryView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Machine Summary";
	_machineSummaryView = [[MachineSummaryView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [_machineSummaryView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:_machineSummaryView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
