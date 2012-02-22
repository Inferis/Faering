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
#import "SimOverlayController.h"
#import "SimTabBarPhoneController.h"
#import "Coby.h"
#import "UIColor+Hex.h"

@interface UIView (RecursiveClips) 

- (NSString*)recursiveDescription:(NSString*(^)(UIView* view))printer;

@end

@implementation UIView (RecursiveClips) 

- (NSString*)recursiveDescription:(NSString*(^)(UIView* view))printer prefix:(NSString*)prefix {
    NSString* result = [NSString stringWithFormat:@"%@- (%p) %@ %@\n", prefix, self, [self class], printer(self)];
    
    for (UIView* view in self.subviews) {
        result = [result stringByAppendingString:[view recursiveDescription:printer prefix:[prefix stringByAppendingString:@"  "]]];
    }
    
    return result;
}

- (NSString*)recursiveDescription:(NSString*(^)(UIView* view))printer {
    return [self recursiveDescription:printer prefix:@""];
}

@end

//@implementation UITabBar (Layout)
//
//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//    int i = 0;
//    CGFloat w = CGRectGetWidth(self.bounds)/4.0;
//    for (UIView* view in [self subviews]) {
//        if ([NSStringFromClass([view class]) isEqualToString:@"UITabBarButton"]) {
//            view.frame = (CGRect) { (i+0.5)*w, view.frame.origin.y, w, view.frame.size.height };
//            i++;
//        }
//        NSLog(@"%@", [view debugDescription]);
//    }
//}
//
//@end


@implementation RootPhoneController

- (id)init {
    UINavigationController* leftController = [[UINavigationController alloc] initWithRootViewController:[[AccountListController alloc] initWithNibName:@"AccountListView" bundle:nil]];
    leftController.navigationBarHidden = YES;
    
    SimOverviewPhoneController* overviewController = [[SimOverviewPhoneController alloc] initWithNibName:@"SimOverviewPhoneView" bundle:nil];
    SimUsagePhoneController* usageController = [[SimUsagePhoneController alloc] initWithNibName:@"SimUsagePhoneView" bundle:nil];
    SimTopupsPhoneController* topupsController = [[SimTopupsPhoneController alloc] initWithNibName:@"SimTopupsPhoneView" bundle:nil];
    
    SimTabBarPhoneController* tabController = [[SimTabBarPhoneController alloc] init];
    tabController.viewControllers = [[NSArray arrayWithObjects:overviewController, usageController, topupsController, nil] map:^id(id obj) {
        SimOverlayController* controller = [[SimOverlayController alloc] initWithChildController:obj];
        return controller;
    }];
    
    tabController.view.clipsToBounds = NO;
    [[tabController.view.subviews objectAtIndex:0] setClipsToBounds:NO];
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}


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
