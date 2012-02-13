//
//  AccountListController.m
//  Faering
//
//  Created by Tom Adriaenssen on 07/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "AccountListController.h"
#import "Account.h"
#import "Sim.h"
#import "IIViewDeckController.h"
#import "AddAccountController.h"
#import "AccountCell.h"
#import "UITableViewCell+AutoDequeue.h"
#import "UIColor+Hex.h"

@interface AccountListController () <AddAccountDelegate, AccountCellDelegate, UIActionSheetDelegate> {
    BOOL _first;
    Account* _actionAccount;
}
@end

@implementation AccountListController

@synthesize tableView = _tableView;
@synthesize addButton = _addButton;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Accounts";
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView.backgroundView removeFromSuperview];
    _first = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_first) {
        _first = NO;

        CGFloat width = self.addButton.superview.frame.size.width - self.addButton.frame.origin.x * 2;
        if (self.viewDeckController) {
            width -= self.viewDeckController.leftLedge;
        }
        self.addButton.frame = (CGRect) { self.addButton.frame.origin, width, self.addButton.frame.size.height }; 
        
        if ([[[MVStorage sharedStorage] accounts] count] == 0) {
            [[MVStorage sharedStorage] addAccountWithName:@"InferisPad" accessToken:@"m.0070028"];
            [[MVStorage sharedStorage] addAccountWithName:@"InferisPad2" accessToken:@"m.0070028"];
            [[MVStorage sharedStorage] addAccountWithName:@"InferisPad3" accessToken:@"m.0070028"];

            [self.tableView reloadData];
//            [self pressedAdd:nil];
//            [self.viewDeckController openLeftViewAnimated:NO];
        }
        else {
            
        }
    }
    else {
    }
}

- (BOOL)viewDeckControllerWillOpenLeftView:(IIViewDeckController*)viewDeckController animated:(BOOL)animated {
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:NO];
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 26;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* view = [[UIView alloc] initWithFrame:(CGRect) { 0, 0, 320, 26 }];
    view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    
    UILabel* label = [UILabel new];
    label.text = @"Accounts";
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
    label.textColor = [UIColor colorWithHex:0xcce4e1db];
    label.shadowColor = [UIColor colorWithWhite:0 alpha:0.6];
    label.shadowOffset = (CGSize) { 0, -1 }; 
    label.frame = (CGRect) { 10, 2, 310, 22 };
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.backgroundColor = [UIColor clearColor];
    
    [view addSubview:label];
        
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[MVStorage sharedStorage] accounts] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AccountCell* cell = [AccountCell tableViewAutoDequeueCell:tableView];
    [cell configure:[[[MVStorage sharedStorage] accounts] objectAtIndex:indexPath.row] delegate:self];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
    }];
}

#pragma mark - Actions 

- (IBAction)pressedAdd:(id)sender {
    AddAccountController* controller = [[AddAccountController alloc] initWithNibName:@"AddAccountView" bundle:nil];
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:^{
    }];
}


- (IBAction)pressedSettings:(id)sender {
}

#pragma mark - Account Cell Delegate

- (void)accountCellDidPressDetail:(AccountCell*)cell {
    _actionAccount = [[[MVStorage sharedStorage] accounts] objectAtIndex:[self.tableView indexPathForCell:cell].row];
    UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:[NSString stringWithFormat:@"What would you like to do with account '%@'?", _actionAccount.name] 
                                                       delegate:self 
                                              cancelButtonTitle:@"Cancel" 
                                         destructiveButtonTitle:@"Delete" 
                                              otherButtonTitles:@"Reauthenticate", nil];
    [sheet showFromRect:cell.frame inView:self.view animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // delete
        [[MVStorage sharedStorage] removeAccount:_actionAccount];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (buttonIndex == 1) {
        // reauthenticate
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    _actionAccount = nil;
}

#pragma mark - Add Account Delegate

- (void)addAccountController:(AddAccountController *)controller didAddAccountWithName:(NSString *)name accessToken:(NSString *)token {
    [self dismissViewControllerAnimated:YES completion:^{
        [self.viewDeckController openLeftView];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }];
}

- (void)addAccountControllerDidCancel:(AddAccountController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
