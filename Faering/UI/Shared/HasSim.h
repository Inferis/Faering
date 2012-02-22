//
//  SimContainerDelegate.h
//  Faering
//
//  Created by Tom Adriaenssen on 22/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Sim;

@protocol HasSim <NSObject>

@required
@property (nonatomic, strong) Sim* sim;

@end
