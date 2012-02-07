//
//  AccountListController.h
//  Faering
//
//  Created by Tom Adriaenssen on 07/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountListController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (atomic, retain) IBOutlet UITableView* tableView;
@property (atomic, retain) IBOutlet UIButton* addButton;

- (IBAction)pressedAdd:(id)sender;
- (IBAction)pressedSettings:(id)sender;

@end
