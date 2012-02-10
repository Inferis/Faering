//
//  AddAccountController.h
//  Faering
//
//  Created by Tom Adriaenssen on 07/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddAccountController;

@protocol AddAccountDelegate <NSObject>

- (void)addAccountControllerDidCancel:(AddAccountController*)controller;
- (void)addAccountController:(AddAccountController*)controller didAddAccountWithName:(NSString*)name accessToken:(NSString*)token;

@end



@interface AddAccountController : UIViewController

@property (nonatomic, retain) id<AddAccountDelegate> delegate;
@property (nonatomic, retain) IBOutlet UIWebView* webView;

- (IBAction)pressedDone:(id)sender;
- (IBAction)pressedCancel:(id)sender;

@end
