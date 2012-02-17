//
//  MVAPI.h
//  Faering
//
//  Created by Tom Adriaenssen on 07/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVAPI : NSObject

- (void)account:(Account*)account fetchMSISDNsCompletion:(void(^)(NSArray* result))completion;

@end
