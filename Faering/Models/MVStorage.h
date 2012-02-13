//
//  MVStorage.h
//  Faering
//
//  Created by Tom Adriaenssen on 07/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Account;

@interface MVStorage : NSObject

- (NSArray*)accounts;
- (void)addAccountWithName:(NSString*)name accessToken:(NSString*)accessToken;
- (void)removeAccount:(Account*)account;

+ (MVStorage*)sharedStorage;

@end
