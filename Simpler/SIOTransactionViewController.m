//
//  SIOTransactionViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import "SIOTransactionViewController.h"
#import "SIOWalletViewController.h"
#import "Card+SIO.h"


@implementation SIOTransactionViewController

@synthesize transactionDetails;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Wallet" style:UIBarButtonItemStylePlain target:self action:@selector(wallet)];
        _card = [Card getDefaultCard:self->ctx];
        _paymentNeedsConfirmation = YES;
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
    
    NSMutableArray * viewControllers = [NSMutableArray arrayWithArray: self.navigationController.viewControllers];
    [viewControllers removeObjectAtIndex:[viewControllers count] -2];
    self.navigationController.viewControllers = viewControllers;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) viewWillAppear:(BOOL)animated{
    [self setCardViews];
    double total = 0;
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    for(NSDictionary * item in [transactionDetails objectForKey:@"items"]){
        total +=  [[f numberFromString:[item objectForKey:@"price"]] doubleValue];
    }
    _totalCost = [NSString stringWithFormat:@"%.2f", total ];
    [_paymentButton setTitle:_totalCost forState:UIControlStateNormal];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void) cancel {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) wallet {
    SIOWalletViewController * walletViewController = [[SIOWalletViewController alloc] init];
    walletViewController.selectedCard = _card;
    walletViewController.delegate = self;
    [self.navigationController pushViewController:walletViewController animated:YES];
    _paymentNeedsConfirmation = YES;
    [_paymentButton setTitle:_totalCost forState:UIControlStateNormal];

}

- (void) setCardViews {
    _cardName.text = _card.name;
    _cardType.text = _card.card_type;
    _lastFour.text = [NSString stringWithFormat:@"xxxx-xxxx-xxxx-%@", _card.last_four ];
}
-(IBAction)didTapPayButton:(id)sender {
    if(_paymentNeedsConfirmation){
        _paymentButton.titleLabel.text = @"Confirm";
        _paymentNeedsConfirmation = NO;
    } else {
        // Just show alert for now, actually this will happen in the REST callback
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Payment Completed" message:@"Your payment has been completed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark SIOTransactionViewControllerDelegate
- (void)changeCard:(Card *)card{
    _card = card;
}

@end
