//
//  HPDT_HomeViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "SIOAppDelegate.h"
#import "SIOHomeViewController.h"
#import "SIOProfileViewController.h"
#import "SIOAddCardViewController.h"
#import "SIOEditCardViewController.h"
#import "SIOQRScannerViewController.h"
#import "User+SIO.h"
#import "Card+SIO.h"

@implementation SIOHomeViewController

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
    
    User * user = [User getCurrentUserInContext:self->ctx];
    self.header.text = [NSString stringWithFormat:@"%@'s Wallet", user.name];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark IBActions
-(IBAction)didTapProfileButton:(id)sender{
    self.navigationController.navigationBarHidden = NO;
    
    SIOProfileViewController * profileViewController = [[SIOProfileViewController alloc] init];
    [self.navigationController pushViewController:profileViewController animated:YES];
}

-(IBAction)didTapAddCardButton:(id)sender{
    self.navigationController.navigationBarHidden = NO;
    
    SIOAddCardViewController * addCardViewController = [[SIOAddCardViewController alloc] init];
    addCardViewController.title = @"Add Card";
    [self.navigationController pushViewController:addCardViewController animated:YES];
}

-(IBAction)didTapPayButton:(id)sender{
    self.navigationController.navigationBarHidden = NO;

    SIOQRScannerViewController * qrScannerViewController = [[SIOQRScannerViewController alloc] init];
    qrScannerViewController.title = @"QR Scanner";
    [self.navigationController pushViewController:qrScannerViewController animated:YES];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    self.navigationController.navigationBarHidden = NO;
    [self pushEditCardView:[self.cards objectAtIndex:[indexPath row]]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    [self pushEditCardView:[self.cards objectAtIndex:[indexPath row]]];
}


#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [super tableView:tableView numberOfRowsInSection:section];
}

@end
