//
//  HPDT_BanksViewController.h
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPDTCardsViewController.h"

@interface HPDT_BanksViewController : HPDTCardsViewController

@property (nonatomic,strong) IBOutlet UILabel * defaultCardName;
@property (nonatomic,strong) IBOutlet UILabel * defaultCardType;
@property (nonatomic,strong) IBOutlet UILabel * defaultCardLastFour;
@property (nonatomic,strong) IBOutlet UIImageView * defaultCardImageView;

- (IBAction)didTapAddCard:(id)sender;

@end
