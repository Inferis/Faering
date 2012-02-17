//
//  MVAPI.m
//  Faering
//
//  Created by Tom Adriaenssen on 07/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "MVAPI.h"
#import "Account.h"
#import "Tin.h"
#import "Tin+BasicAuthentication.h"

@interface MVAPI ()

- (Tin*)tin:(Account*)account;

@end

@implementation MVAPI


- (void)account:(Account*)account fetchMSISDNsCompletion:(void(^)(NSArray* result))completion {
    [[self tin:account] get:@"/msisdn_list.json" query:@"alias=1" success:^(TinResponse *response) {
        completion(nil);
    }];
}


- (Tin*)tin:(Account*)account  {
    Tin* tin = [[Tin new] authenticateWithUsername:account.name password:account.accessToken];
    tin.baseURI = @"https://mobilevikings.com/api/2.0/basic/";
    return tin;
}

@end
