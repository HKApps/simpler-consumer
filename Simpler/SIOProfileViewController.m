//
//  SIOProfileViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import "SIOProfileViewController.h"
#import "User+SIO.h"
#import "SIOAppDelegate.h"
#import "SIOBanksViewController.h"
#import "KKPasscodeSettingsViewController.h"

@implementation SIOProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.rowTitles = @[@"Banks & Cards", @"Passcode Lock", @"Set Payment Preferences", @"Transaction History"];
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

- (void)viewWillAppear:(BOOL)animated {
    [_tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)didTapLogout{
    SIOAppDelegate *appDelegate = ( SIOAppDelegate *) [[UIApplication sharedApplication] delegate];
    [appDelegate logout];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProfileTableViewCell"];
    cell.textLabel.text = (NSString*) [_rowTitles objectAtIndex:[indexPath row]];
    if([indexPath row] == 1){
        if([[KKPasscodeLock sharedLock] isPasscodeRequired]){
            cell.textLabel.text = [cell.textLabel.text stringByAppendingFormat:@"         ON"];
        } else {
            cell.textLabel.text = [cell.textLabel.text stringByAppendingFormat:@"         OFF"];
        }
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    switch([indexPath row]){
        case 0:
        {
            SIOBanksViewController * banksViewController = [[SIOBanksViewController alloc] init];
            [self.navigationController pushViewController:banksViewController animated:YES];
            break;
        }
        case 1:
        {
            KKPasscodeSettingsViewController * passcodeEntryViewController = [[KKPasscodeSettingsViewController alloc] init];
            [self.navigationController pushViewController:passcodeEntryViewController animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
