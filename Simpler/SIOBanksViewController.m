//
//  SIOBanksViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import "SIOBanksViewController.h"
#import "SIOAddCardViewController.h"
#import "Card+SIO.h"

@implementation SIOBanksViewController

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
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    Card * defaultCard = [Card getDefaultCard:self->ctx];
    _defaultCardName.text = defaultCard.name;
    _defaultCardLastFour.text = defaultCard.last_four;
    _defaultCardType.text = defaultCard.card_type;
    _defaultCardImageView.image = defaultCard.cardImage;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark IBActions

- (IBAction)didTapAddCard:(id)sender {
    //self.navigationController.navigationBarHidden = NO;
    
    SIOAddCardViewController * addCardViewController = [[SIOAddCardViewController alloc] init];
    addCardViewController.title = @"Add Card";
    [self.navigationController pushViewController:addCardViewController animated:YES];
}

#pragma mark UITableViewDatasource 
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    //self.navigationController.navigationBarHidden = NO;
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

@end
