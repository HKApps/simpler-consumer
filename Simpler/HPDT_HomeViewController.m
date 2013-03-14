//
//  HPDT_HomeViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "HPDTAppDelegate.h"
#import "HPDT_HomeViewController.h"
#import "HPDT_ProfileViewController.h"
#import "HPDT_AddCardViewController.h"
#import "HPDT_EditCardViewController.h"
#import "QRScannerViewController.h"
#import "User+HPDT.h"

@implementation HPDT_HomeViewController

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
    
    [User getCurrentUserInContext:self->ctx];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) viewWillAppear:(BOOL)animated {
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
    
    HPDT_ProfileViewController * profileViewController = [[HPDT_ProfileViewController alloc] init];
    [self.navigationController pushViewController:profileViewController animated:YES];
}

-(IBAction)didTapAddCardButton:(id)sender{
    self.navigationController.navigationBarHidden = NO;
    
    HPDT_AddCardViewController * addCardViewController = [[HPDT_AddCardViewController alloc] init];
    addCardViewController.title = @"Add Card";
    [self.navigationController pushViewController:addCardViewController animated:YES];
}

-(IBAction)didTapPayButton:(id)sender{
    self.navigationController.navigationBarHidden = NO;

    QRScannerViewController * qrScannerViewController = [[QRScannerViewController alloc] init];
    qrScannerViewController.title = @"QR Scanner";
    [self.navigationController pushViewController:qrScannerViewController animated:YES];
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    self.navigationController.navigationBarHidden = NO;

    HPDT_EditCardViewController * editCardViewController = [[HPDT_EditCardViewController alloc] init];
    editCardViewController.title = @"Edit Card";
    [self.navigationController pushViewController:editCardViewController animated:YES];
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
