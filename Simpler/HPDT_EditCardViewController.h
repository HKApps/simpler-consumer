//
//  HPDT_EditCardViewController.h
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPDTViewController.h"
#import "Card+HPDT.h"

@interface HPDT_EditCardViewController : HPDTViewController
<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (nonatomic,strong) Card * card;

@property (nonatomic,strong) IBOutlet UILabel * cardName;
@property (nonatomic,strong) IBOutlet UILabel * cardType;
@property (nonatomic,strong) IBOutlet UILabel * cardLastFour;
@property (nonatomic,strong) IBOutlet UIImageView * cardImageView;


@end
