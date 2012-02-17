//
//  SimOverlayController.m
//  Faering
//
//  Created by Tom Adriaenssen on 15/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "SimOverlayController.h"

@interface SimOverlayController ()

@property (nonatomic, retain) IBOutlet UIView* childView;
@property (nonatomic, retain) IBOutlet UIView* labelView;

@end

@implementation SimOverlayController

@synthesize childView = _childView;
@synthesize labelView = _labelView;

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
    
    NSLog(@"%@", self.labelView);
    [self.labelView setNeedsLayout];
    [self.labelView setNeedsDisplay];
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


@end
