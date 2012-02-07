//
//  RootPhoneController.m
//  Faering
//
//  Created by Tom Adriaenssen on 05/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "RootPhoneController.h"
#import "AccountListController.h"
#import "SimListController.h"
#import "SimOverviewPhoneController.h"
#import "SimUsagePhoneController.h"
#import "SimTopupsPhoneController.h"
#import "Coby.h"

@implementation RootPhoneController

- (id)init {
    UINavigationController* leftController = [[UINavigationController alloc] initWithRootViewController:[[AccountListController alloc] initWithNibName:@"AccountListView" bundle:nil]];
    leftController.navigationBar.tintColor = [UIColor blackColor];
    
    SimOverviewPhoneController* overviewController = [[SimOverviewPhoneController alloc] initWithNibName:@"SimOverviewPhoneView" bundle:nil];
    SimUsagePhoneController* usageController = [[SimUsagePhoneController alloc] initWithNibName:@"SimUsagePhoneView" bundle:nil];
    SimTopupsPhoneController* topupsController = [[SimTopupsPhoneController alloc] initWithNibName:@"SimTopupsPhoneView" bundle:nil];
    
    UITabBarController* tabController = [[UITabBarController alloc] init];
    tabController.viewControllers = [[NSArray arrayWithObjects:overviewController, usageController, topupsController, nil] map:^id(id obj) {
        return [[UINavigationController alloc] initWithRootViewController:obj];
    }];
    
    self = [super initWithCenterViewController:tabController leftViewController:leftController];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
