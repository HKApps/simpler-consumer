//
//  HPDT_AddCardViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "HPDT_AddCardViewController.h"

@implementation HPDT_AddCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self->creditViewOnTop = YES;
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

-(IBAction)didTapCreditCardButton:(id)sender{
    if(!creditViewOnTop){
        _creditCardButton.selected = YES;
        _giftCardButton.selected = NO;
        [_dataContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_dataContainerView addSubview:_addCreditCardView];
        creditViewOnTop = YES;
    }
    
    
}

-(IBAction)didTapGiftCardButton:(id)sender{
    if(creditViewOnTop){
        _creditCardButton.selected = NO;
        _giftCardButton.selected = YES;
        [_dataContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_dataContainerView addSubview:_addGiftCardView];
        creditViewOnTop = NO;
    }
    
}


@end
