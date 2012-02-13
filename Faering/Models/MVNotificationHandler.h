//
//  MVNotificationHandler.h
//  Faering
//
//  Created by Tom Adriaenssen on 13/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVNotificationHandler : NSObject

- (void)onNotification:(NSString*)notification do:(void(^)(id obj))block;
- (void)onNotification:(NSString*)notification doOnMainThread:(void(^)(id obj))block;
- (void)onNotifications:(NSArray*)notifications do:(void(^)(id obj))block;
- (void)onNotifications:(NSArray*)notifications doOnMainThread:(void(^)(id obj))block;
                                                   
@end
