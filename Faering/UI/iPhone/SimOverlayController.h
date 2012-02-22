//
//  SimOverlayController.h
//  Faering
//
//  Created by Tom Adriaenssen on 15/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HasSim.h"

@interface SimOverlayController : UIViewController<HasSim>

@property (nonatomic, retain, readonly) UIViewController<HasSim>* childController;

- (id)initWithChildController:(UIViewController<HasSim>*)childController;


@end
