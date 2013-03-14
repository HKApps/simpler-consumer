//
//  HPDT_HomeViewController.h
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPDTCardsViewController.h"

@interface HPDT_HomeViewController : HPDTCardsViewController
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UILabel * header;

-(IBAction)didTapProfileButton:(id)sender;
-(IBAction)didTapAddCardButton:(id)sender;
-(IBAction)didTapPayButton:(id)sender;

@end
