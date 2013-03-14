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
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBarHidden = YES;
    
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
-(IBAction)didTapProfileButton:(id)sender{
    self.navigationController.navigationBarHidden = NO;
    
    HPDT_ProfileViewController * profileViewController = [[HPDT_ProfileViewController alloc] init];
    [self.navigationController pushViewController:profileViewController animated:YES];
}

-(IBAction)didTapAddCardButton:(id)sender{
    HPDT_AddCardViewController * addCardViewController = [[HPDT_AddCardViewController alloc] init];
    [self.navigationController pushViewController:addCardViewController animated:YES];
}

-(IBAction)didTapPayButton:(id)sender{
    QRScannerViewController * qrScannerViewController = [[QRScannerViewController alloc] init];
    [self.navigationController pushViewController:qrScannerViewController animated:YES];
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    HPDT_EditCardViewController * editCardViewController = [[HPDT_EditCardViewController alloc] init];
    [self.navigationController pushViewController:editCardViewController animated:YES];
}


#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}


@end
