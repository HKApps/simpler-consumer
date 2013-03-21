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
    if([Login validateLogin:_emailAddress.text password:_password.text]){
        
        [(SIOAppDelegate*) [[UIApplication sharedApplication] delegate] showHomeView];
        
    } else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Invalid username or password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}


- (IBAction)doneEditing:(id)sender{
    [(UIView*) sender resignFirstResponder];
}



- (IBAction)facebookAuthButtonAction:(id)sender {
    SIOAppDelegate *appDelegate = (SIOAppDelegate *) [[UIApplication sharedApplication] delegate];
    // The user has initiated a login, so call the openSession method
    // and show the login UX if necessary.
    [appDelegate openSessionWithAllowLoginUI:YES];
}

- (IBAction)didTapRegisterButton:(id)sender {
    SIORegisterViewController * registerViewController = [[SIORegisterViewController alloc] init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}


@end
