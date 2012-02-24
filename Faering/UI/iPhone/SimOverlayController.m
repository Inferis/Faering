//
//  SimOverlayController.m
//  Faering
//
//  Created by Tom Adriaenssen on 15/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "SimOverlayController.h"
#import "IIViewDeckController.h"
#import "Sim.h"

@interface SimOverlayController ()

@property (nonatomic, retain) IBOutlet UIView* childView;
@property (nonatomic, retain) IBOutlet UIView* labelView;
@property (nonatomic, retain) IBOutlet UILabel* numberLabel;
@property (nonatomic, retain) IBOutlet UILabel* aliasLabel;

- (IBAction)settingsPressed:(id)sender;
- (IBAction)pressedToggle:(id)sender;

@end

@implementation SimOverlayController

@synthesize childView = _childView;
@synthesize labelView = _labelView;
@synthesize numberLabel = _numberLabel;
@synthesize aliasLabel = _aliasLabel;

- (void)setSim:(Sim *)sim {
    [self.childController setSim:sim];
    
    self.numberLabel.text = sim.msisdn;
    self.aliasLabel.text = sim.alias;
}

- (Sim *)sim {
    return [self.childController sim];
}

- (UIViewController*)childController {
    return [[self childViewControllers] objectAtIndex:0];
}

- (id)initWithChildController:(UIViewController*)controller {
    if ((self = [self initWithNibName:@"SimOverlayController" bundle:nil])) {
        [self addChildViewController:controller];
    }

    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.clipsToBounds = NO;
    [self.childView addSubview:self.childController.view];

    self.numberLabel.text = self.childController.sim.msisdn;
    self.aliasLabel.text = self.childController.sim.alias;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.childView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (UITabBarItem *)tabBarItem {
    return self.childController.tabBarItem;
}


- (IBAction)pressedToggle:(id)sender {
    [self.tabBarController.viewDeckController toggleLeftView];
}

- (IBAction)settingsPressed:(id)sender {
    
}


@end
