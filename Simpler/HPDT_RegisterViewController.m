//
//  HPDT_RegisterViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "HPDT_RegisterViewController.h"
#import "HPDTAppDelegate.h"

@implementation HPDT_RegisterViewController

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
    
    [(HPDTAppDelegate*) [[UIApplication sharedApplication] delegate] showHomeView];

}


@end
