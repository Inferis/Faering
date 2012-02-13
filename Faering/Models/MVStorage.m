//
//  MVStorage.m
//  Faering
//
//  Created by Tom Adriaenssen on 07/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "MVStorage.h"
#import "Account.h"

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

    // notify
}

- (void)removeAccount:(Account*)account {
    [account deleteEntity];
    [[NSManagedObjectContext contextForCurrentThread] save];
    
    // notify
}

@end
