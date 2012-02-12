//
//  AddAccountController.m
//  Faering
//
//  Created by Tom Adriaenssen on 07/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "AddAccountController.h"
#import "MBProgressHUD.h"
#import "Tin.h"
#import "Tin+OAuth.h"
#import "Tin+BasicAuthentication.h"
#import "TinResponse.h"

@interface AddAccountController () <UIWebViewDelegate>

@property (nonatomic, retain) NSString* token;
@property (nonatomic, retain) NSString* tokenSecret;

@end

@implementation AddAccountController

@synthesize delegate = _delegate;
@synthesize webView = _webView;
@synthesize token = _token;
@synthesize tokenSecret = _tokenSecret;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.webView = nil;    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [MBProgressHUD showHUDAddedTo:self.webView animated:YES];
    
    Tin* tin = [[Tin alloc] init];
    tin.baseURI = @"https://mobilevikings.com/api/2.0/";
    tin.debugOutput = YES;

    [[tin signedWithClientKey:@"kuGVZHgQ3WLpQCf5fR" clientSecret:@"ZnTCzrn6JtnQyX9f84jyYNBPCK9Fyf7v"] get:@"oauth/request_token/" query:[NSDictionary dictionaryWithObject:@"http://oauth/callback" forKey:@"oauth_callback"] success:^(TinResponse *response) {
        response.parseMethod = TinFormURLParseMethod;
        NSDictionary* keys = response.parsedResponse;
        if (response.error) {
            NSLog(@"Error! %@", response.error);
            [MBProgressHUD hideHUDForView:self.webView animated:YES];
            return;
        }
        
        self.token = [keys fetch:@"oauth_token"];
        self.tokenSecret = [keys fetch:@"auth_token_secret"];
        NSString* url = [NSString stringWithFormat:@"https://mobilevikings.com/api/2.0/oauth/authorize/?oauth_token=%@", self.token];
        NSLog(@"url = %@", url);
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [self.webView loadRequest:request];
    }];
    
    
//    OAConsumer* consumer = [[OAConsumer alloc] initWithKey:@"kuGVZHgQ3WLpQCf5fR" secret:@"ZnTCzrn6JtnQyX9f84jyYNBPCK9Fyf7v"];
//    OAMutableURLRequest* request = [[OAMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://mobilevikings.com/api/2.0/oauth/request_token/"] consumer:consumer token:nil realm:nil signatureProvider:nil];
//    [request setOAuthParameterName:@"oauth_callback" withValue:@"faering://callback"];
//    [request setHTTPMethod:@"POST"];
//    
//    OADataFetcher* fetcher = [[OADataFetcher alloc] init];
//    [fetcher fetchDataWithRequest:request 
//                         delegate:self 
//                didFinishSelector:@selector(requestTokenTicket:didFinishWithData:) 
//                  didFailSelector:@selector(requestTokenTicket:didFailWithError:)];
}

//- (void)requestTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
//    if (ticket.didSucceed) {
//        NSString *responseBody = [[NSString alloc] initWithData:data
//                                                       encoding:NSUTF8StringEncoding];
//        OAToken* requestToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
//        
//        OAConsumer* consumer = [[OAConsumer alloc] initWithKey:@"kuGVZHgQ3WLpQCf5fR" secret:@"ZnTCzrn6JtnQyX9f84jyYNBPCK9Fyf7v"];
//        OAMutableURLRequest* request = [[OAMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@""] consumer:consumer token:requestToken realm:nil signatureProvider:nil];
//        [request setHTTPMethod:@"GET"];https://mobilevikings.com/api/2.0/oauth/authorize/
//        [request prepare];
//        
//        [self.webView loadRequest:request];
//    }
//    else 
//        [MBProgressHUD hideHUDForView:self.webView animated:YES];
//}
//
//- (void)requestTokenTicket:(OAServiceTicket *)ticket didFailWithError:(NSError *)error {
//    [MBProgressHUD hideHUDForView:self.webView animated:YES];
//}
//
//
- (IBAction)pressedDone:(id)sender {
    NSString* name = @"InferisPad";
    NSString* token = @"123";
    [self.delegate addAccountController:self didAddAccountWithName:name accessToken:token];
}

- (IBAction)pressedCancel:(id)sender {
    [self.delegate addAccountControllerDidCancel:self];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"req = %@", webView.request);
    if (webView.request)
        [MBProgressHUD hideHUDForView:webView animated:YES];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"req = %@", request.URL);
    return YES;
}

@end
