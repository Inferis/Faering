//
//  SimCell.m
//  Faering
//
//  Created by Tom Adriaenssen on 22/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "SimCell.h"
#import "Sim.h"

@implementation SimCell

- (void)configure:(Sim*)sim {
    self.textLabel.text = sim.msisdn;
    self.detailTextLabel.text = sim.alias;
}

@end
