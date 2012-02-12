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

@interface AccountListController () <AddAccountDelegate> {
    BOOL _first;
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
            Account* account = [Account createEntity];
            account.name = @"InferisPad";
            account.accessToken = @"m.0070028";
            [[NSManagedObjectContext contextForCurrentThread] save];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[MVStorage sharedStorage] accounts] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AccountCell* cell = [AccountCell tableViewDequeueCell:tableView]
    static NSString *CellIdentifier = @"AccountCell";
    
    AccountCell *cell = (AccountCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - Actions 

- (IBAction)pressedAdd:(id)sender {
    AddAccountController* controller = [[AddAccountController alloc] initWithNibName:@"AddAccountView" bundle:nil];
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:^{
    }];
}


- (IBAction)pressedSettings:(id)sender {
//    [self presentViewController:nil animated:YES completion:^{
//        code
//    }];
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
