//
//  SIOWalletViewController.h
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIOCardsViewController.h"
#import "SIOTransactionViewController.h"
#import "Card+SIO.h"

@interface SIOWalletViewController : SIOCardsViewController
<UISearchBarDelegate>

@property (nonatomic, unsafe_unretained) id<SIOTransactionViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *searchString;
@property (nonatomic, strong) Card * selectedCard;

@end
