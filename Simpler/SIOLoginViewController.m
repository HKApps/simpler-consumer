//
//  SIOLoginViewController.m
//  Simpler
//
//  Created by Matthew Shultz on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import "SIOLoginViewController.h"
#import "Login.h"
#import "SIOAppDelegate.h"
#import "SIORegisterViewController.h"
#import "SIOConstants.h"
#import "AFJSONRequestOperation.h"
#import "AFHTTPClient.h"
#import "SIOUtil.h"
#import "User+SIO.h"

@interface SIOLoginViewController ()

@end

@implementation SIOLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonAction:(id)sender {
    
    //if([Login validateLogin:_emailAddress.text password:_password.text]){
    //Possible login validation before handing off to remote server
    
    //Should lock UI
    
    NSString * email = _emailAddress.text;
    NSString * password = _password.text;
    
    NSDictionary * parameters = @{@"user_session":@{
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
                                            [self loginSucceeded: (NSDictionary *) JSON];

                                        }
                                         failure:^( NSURLRequest *request , NSURLResponse *response , NSError *error , id JSON ) {
                                             [SIOUtil httpError];
                                         }];
    [operation start];
    
        

}


- (IBAction)doneEditing:(id)sender{
    [(UIView*) sender resignFirstResponder];
}



- (IBAction)facebookAuthButtonAction:(id)sender {
    SIOAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    // The user has initiated a login, so call the openSession method
    // and show the login UX if necessary.
    [appDelegate openSessionWithAllowLoginUI:YES];
}

- (IBAction)didTapRegisterButton:(id)sender {
    SIORegisterViewController * registerViewController = [[SIORegisterViewController alloc] init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}


- (void) loginSucceeded: (NSDictionary *) parameters {
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
