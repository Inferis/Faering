//
//  AccountCell.h
//  Faering
//
//  Created by Tom Adriaenssen on 12/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Account;
@class AccountCell;

@protocol AccountCellDelegate <NSObject>

- (void)accountCellDidPressDetail:(AccountCell*)cell;

@end

@interface AccountCell : UITableViewCell

- (void)configure:(Account*)account delegate:(id<AccountCellDelegate>) delegate;

@end
