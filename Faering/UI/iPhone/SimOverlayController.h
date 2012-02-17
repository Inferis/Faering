//
//  SimOverlayController.h
//  Faering
//
//  Created by Tom Adriaenssen on 15/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimOverlayController : UIViewController

@property (nonatomic, retain, readonly) UIViewController* childController;

- (id)initWithChildController:(UIViewController*)childController;

@end
