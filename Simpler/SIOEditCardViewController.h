//
//  SIOEditCardViewController.h
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIOViewController.h"
#import "Card+SIO.h"

@interface SIOEditCardViewController : SIOViewController
<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (nonatomic,strong) Card * card;

@property (nonatomic,strong) IBOutlet UILabel * cardName;
@property (nonatomic,strong) IBOutlet UILabel * cardType;
@property (nonatomic,strong) IBOutlet UILabel * cardLastFour;
@property (nonatomic,strong) IBOutlet UIImageView * cardImageView;


@end
