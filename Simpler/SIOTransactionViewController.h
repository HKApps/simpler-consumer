//
//  SIOTransactionViewController.h
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIOViewController.h"
#import "Card+SIO.h"

@protocol SIOTransactionViewControllerDelegate <NSObject>

- (void)changeCard:(Card *)card;

@end

@interface SIOTransactionViewController : SIOViewController
<SIOTransactionViewControllerDelegate>

@property (nonatomic, strong) IBOutlet UIButton * paymentButton;
@property (nonatomic, strong) IBOutlet UILabel * cardName;
@property (nonatomic, strong) IBOutlet UILabel * lastFour;
@property (nonatomic, strong) IBOutlet UILabel * cardType;
@property (nonatomic, strong) IBOutlet UIImageView * cardImage;

@property (nonatomic, strong) NSDictionary * transactionDetails;
@property (nonatomic, strong) Card * card;
@property (nonatomic) BOOL paymentNeedsConfirmation;
@property (nonatomic, strong) NSString * totalCost;


-(IBAction)didTapPayButton:(id)sender;

@end
