//
//  MVStorage.m
//  Faering
//
//  Created by Tom Adriaenssen on 07/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "MVStorage.h"
#import "Account.h"

@interface MVStorage () {
}

- (void)notify:(NSString*)notification;
- (void)notify:(NSString*)notification with:(id)object;

@end
@implementation MVStorage


- (NSArray*)accounts {
    return [Account MR_findAllSortedBy:@"name" ascending:YES];
}


static MVStorage* _shared;

+ (MVStorage*)sharedStorage {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[MVStorage alloc] init];
    });
    
    return _shared;
}

- (void)addAccountWithName:(NSString*)name accessToken:(NSString*)accessToken {
    Account* account = [Account createEntity];
    account.name = name;
    account.accessToken = accessToken;
    [[NSManagedObjectContext contextForCurrentThread] save];

    [self notify:MV_ACCOUNTS_CHANGED];
    [self notify:MV_ACCOUNT_ADDED with:account];
}

- (void)removeAccount:(Account*)account {
    [account deleteEntity];
    [[NSManagedObjectContext contextForCurrentThread] save];
    
    [self notify:MV_ACCOUNTS_CHANGED];
    [self notify:MV_ACCOUNT_DELETED with:account];
}


#pragma mark - 

- (void)notify:(NSString*)notification {
    [self notify:notification with:nil];
}

- (void)notify:(NSString*)notification with:(id)object {
    [[NSNotificationCenter defaultCenter] postNotificationName:notification object:object];
}

@end

