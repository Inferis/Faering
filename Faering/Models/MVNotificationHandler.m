//
//  MVNotificationHandler.m
//  Faering
//
//  Created by Tom Adriaenssen on 13/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "MVNotificationHandler.h"

@interface MVNotificationHandler () {
    NSMutableArray* _handlers;
}

- (void)onNotification:(NSString*)notification onMainThread:(BOOL)onMainThread do:(void(^)(id obj))block;
+ (void)runOnMainThread:(void(^)(void))block;

@end

@implementation MVNotificationHandler

- (id)init {
    if ((self = [super init])) {
        _handlers = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc {
    for(NSString* oldNotification in _handlers) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:oldNotification object:nil];
    }
    _handlers = nil;
}

- (void)onNotification:(NSString*)notification do:(void(^)(id obj))block {
    [self onNotification:notification onMainThread:NO do:block]; 
}

- (void)onNotification:(NSString*)notification doOnMainThread:(void(^)(id obj))block {
    [self onNotification:notification onMainThread:YES do:block]; 
}

- (void)onNotifications:(NSArray*)notifications do:(void(^)(id obj))block {
    for (NSString* notification in notifications) {
        [self onNotification:notification onMainThread:NO do:block]; 
    }
}

- (void)onNotifications:(NSArray*)notifications doOnMainThread:(void(^)(id obj))block {
    for (NSString* notification in notifications) {
        [self onNotification:notification onMainThread:YES do:block]; 
    }
}

- (void)onNotification:(NSString*)notification onMainThread:(BOOL)onMainThread do:(void(^)(id obj))block {
    for(NSString* oldNotification in [_handlers select:^BOOL(id obj) { return [notification isEqualToString:obj]; }]) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:oldNotification object:nil];
    }
    
    
    if (block) {
        [[NSNotificationCenter defaultCenter] addObserverForName:notification object:nil queue:nil usingBlock:^(NSNotification *note) {
            if (onMainThread && ![NSThread isMainThread]) {
                [self performSelectorOnMainThread:@selector(runOnMainThread:) withObject:^() {
                    block(note.userInfo);
                } waitUntilDone:YES];
            }
            else
                block(note.userInfo);
        }];
    }
}

- (void)runOnMainThread:(void(^)(void))block {
    block();
}

@end 
