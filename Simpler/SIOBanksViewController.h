//
//  SIOBanksViewController.h
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIOCardsViewController.h"

@interface SIOBanksViewController : SIOCardsViewController

@property (nonatomic,strong) IBOutlet UILabel * defaultCardName;
@property (nonatomic,strong) IBOutlet UILabel * defaultCardType;
@property (nonatomic,strong) IBOutlet UILabel * defaultCardLastFour;
@property (nonatomic,strong) IBOutlet UIImageView * defaultCardImageView;

- (IBAction)didTapAddCard:(id)sender;

@end
