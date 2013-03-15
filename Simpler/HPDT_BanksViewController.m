//
//  HPDT_BanksViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "HPDT_BanksViewController.h"
#import "HPDT_AddCardViewController.h"
#import "Card+HPDT.h"

@implementation HPDT_BanksViewController

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
    
    Card * defaultCard = [Card getDefaultCard:self->ctx];
    _defaultCardName.text = defaultCard.name;
    _defaultCardLastFour.text = defaultCard.last_four;
    _defaultCardType.text = defaultCard.type;
    _defaultCardImageView.image = defaultCard.cardImage;
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

- (IBAction)didTapAddCard:(id)sender {
    self.navigationController.navigationBarHidden = NO;
    
    HPDT_AddCardViewController * addCardViewController = [[HPDT_AddCardViewController alloc] init];
    addCardViewController.title = @"Add Card";
    [self.navigationController pushViewController:addCardViewController animated:YES];
}


@end
