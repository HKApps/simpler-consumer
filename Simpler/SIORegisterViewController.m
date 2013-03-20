//
//  SIORegisterViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import "SIORegisterViewController.h"
#import "SIOAppDelegate.h"
#import "SIOUtil.h"
#import "SIOConstants.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import "User+SIO.h"

@implementation SIORegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark IBActions

- (IBAction) didTapSignUpButton: (id) sender {

    //Validate the username and password
    //Regiseter with server (problably asyc call..
    //Then Log them in
    //And switch to home view
    
    NSString * email = _emailAddress.text;
    NSString * password = _password.text;
    
    NSDictionary * parameters = @{@"consumer":@{
                                          @"email" : email,
                                          @"password" : password
                                          }
                                  };
    
    AFHTTPClient * httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:SIO_REST_PATH]];
    httpClient.parameterEncoding = AFJSONParameterEncoding;
    NSMutableURLRequest * urlRequest = [httpClient requestWithMethod:@"POST" path:SIO_LOGIN_PATH parameters:parameters];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:urlRequest
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                             [self registerSucceeded: (NSDictionary *) JSON];
                                             
                                         }
                                         failure:^( NSURLRequest *request , NSURLResponse *response , NSError *error , id JSON ) {
                                             [SIOUtil httpError];
                                         }];
    [operation start];
    

    
    [(SIOAppDelegate*) [[UIApplication sharedApplication] delegate] showHomeView];

}

- (void) registerSucceeded: (NSDictionary *) parameters {
    //Mocking data..
    User * user = [NSEntityDescription
                   insertNewObjectForEntityForName:@"User"
                   inManagedObjectContext:self->ctx];
    user.name = [[parameters objectForKey:@"profile"] objectForKey:@"name"];
    user.api_token = [parameters objectForKey:@"api_token"];
    
    //TODO: handle the credit card UUID's here
    
    [(SIOAppDelegate*) [[UIApplication sharedApplication] delegate] showHomeView];
}



@end
