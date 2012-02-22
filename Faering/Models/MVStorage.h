//
//  MVStorage.h
//  Faering
//
//  Created by Tom Adriaenssen on 07/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MV_ACCOUNTS_CHANGED @"MV_ACCOUNTS_CHANGED"
#define MV_ACCOUNT_ADDED @"MV_ACCOUNTS_ADDED"
#define MV_ACCOUNT_DELETED @"MV_ACCOUNTS_DELETED"

@class Account;

@interface MVStorage : NSObject

@property (nonatomic, strong) Account* activeAccount;

- (NSArray*)accounts;
- (void)addAccountWithName:(NSString*)name accessToken:(NSString*)accessToken;
- (void)removeAccount:(Account*)account;

+ (MVStorage*)sharedStorage;

@end
