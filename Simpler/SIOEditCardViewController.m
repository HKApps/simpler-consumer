//
//  HPDT_EditCardViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "SIOEditCardViewController.h"

@implementation SIOEditCardViewController

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
    
    _cardName.text = _card.name;
    _cardLastFour.text = _card.last_four;
    _cardType.text = _card.card_type;
    _cardImageView.image = _card.cardImage;
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

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    switch ([indexPath row]) {
        case 0:
        {
            NSArray * array = [Card getAllCardsInContext:self->ctx];
            for( Card * aCard in array){
                aCard.isDefault = [NSNumber numberWithBool:NO];
            }
            _card.isDefault = [NSNumber numberWithBool:YES];
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case 1:
        {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Confirm Delete" message:@"Are you sure you want to delete this card" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
            [alert show];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EditCardTableViewCell"];
    switch ([indexPath row]) {
        case 0:
            cell.textLabel.text = @"Set As Default Card";
            break;
        case 1:
            cell.textLabel.text = @"Remove Card";
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        [self->ctx deleteObject:_card];
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
