//
//  AccountCell.h
//  Faering
//
//  Created by Tom Adriaenssen on 12/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftCellBase.h"

@class Account;

@interface AccountCell : LeftCellBase

- (void)configure:(Account*)account;

@end
