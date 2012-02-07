//
//  MVStorage.h
//  Faering
//
//  Created by Tom Adriaenssen on 07/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVStorage : NSObject

- (NSArray*)accounts;

+ (MVStorage*)sharedStorage;

@end
