//
//  SimListController.h
//  Faering
//
//  Created by Tom Adriaenssen on 05/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimListController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (atomic, retain) IBOutlet UITableView* tableView;

@end
