//
//  SimTabBarPhoneController.m
//  Faering
//
//  Created by Tom Adriaenssen on 22/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "SimTabBarPhoneController.h"

@implementation SimTabBarPhoneController

- (void)setSim:(Sim *)sim {
    for (UIViewController<HasSim>* controller in self.viewControllers) {
        controller.sim = sim;
    }
}

- (Sim*)sim {
   return [[self.viewControllers first] sim];
}

@end
