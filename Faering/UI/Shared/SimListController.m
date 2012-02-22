//
//  SimListController.m
//  Faering
//
//  Created by Tom Adriaenssen on 05/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "SimListController.h"
#import "MVNotificationHandler.h"
#import "SimCell.h"
#import "Account.h"
#import "Sim.h"
#import "ReturnCell.h"
#import "UITableViewCell+AutoDequeue.h"
#import "PlaceHolderCell.h"
#import "UIColor+Hex.h"
#import "IIViewDeckController.h"
#import "HasSim.h"

#pragma mark - View lifecycle

@interface SimListController ()  {
    MVNotificationHandler* _notifier;
    BOOL _loading;
}
@end


@implementation SimListController

@synthesize tableView = _tableView;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.frame = (CGRect) { self.tableView.frame.origin, self.tableView.frame.size.width - self.viewDeckController.leftLedge, self.tableView.frame.size.height };
    self.tableView.allowsSelectionDuringEditing = YES;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView.backgroundView removeFromSuperview];
    
    _notifier = [MVNotificationHandler new];
    [_notifier onNotification:MV_ACCOUNTS_CHANGED doOnMainThread:^(id obj) {
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    _notifier = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[MVStorage sharedStorage] refreshSimsForActiveAccount];
    _loading = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 1 : MAX([[[[MVStorage sharedStorage] activeAccount] sims] count], 1);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) return 0;
    return 26;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) return nil;
    
    UIView* view = [[UIView alloc] initWithFrame:(CGRect) { 0, 0, 320, 26 }];
    view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    
    UILabel* label = [UILabel new];
    label.text = [[[MVStorage sharedStorage] activeAccount] name];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
    label.textColor = [UIColor colorWithHex:0xcce4e1db];
    label.shadowColor = [UIColor colorWithWhite:0 alpha:0.6];
    label.shadowOffset = (CGSize) { 0, -1 }; 
    label.frame = (CGRect) { 10, 2, 220, 22 };
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
    
    UIButton* refreshButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    refreshButton.frame = (CGRect) { 235, 2, 30, 20 };
    refreshButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    [refreshButton setTintColor:[UIColor darkGrayColor]];
    [refreshButton setTitle:@"R" forState:UIControlStateNormal];
    refreshButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12];
    [refreshButton addTarget:self action:@selector(refreshPressed:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:refreshButton];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)
        return 32;
    
    if ([[[[MVStorage sharedStorage] activeAccount] sims] count] == 0) 
        return tableView.bounds.size.height - 32 - 26;
        
    return tableView.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ReturnCell* cell = [ReturnCell tableViewAutoDequeueCell:tableView];
        cell.textLabel.text = @"Accounts";
        return cell;
    }
    else if ([[[[MVStorage sharedStorage] activeAccount] sims] count] == 0) {
        PlaceHolderCell* cell = [PlaceHolderCell tableViewAutoDequeueCell:tableView];
        cell.textLabel.text = _loading ? @"Loading sims..." : @"No sims found";
        return cell;
    }
    else {
        SimCell* cell = [SimCell tableViewAutoDequeueCell:tableView];
        [cell configure:[[[[[MVStorage sharedStorage] activeAccount] sims] allObjects] objectAtIndex:indexPath.row]];
        return cell;
    }
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    
    if ([[[[MVStorage sharedStorage] activeAccount] sims] count] == 0) {
        return;
    }
    
    Sim* sim = [[[[[MVStorage sharedStorage] activeAccount] sims] allObjects] objectAtIndex:indexPath.row];
    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
        [(id<HasSim>)controller.centerController setSim:sim];
    }];
}

@end
