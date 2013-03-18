//
//  HPDT_ProfileViewController.h
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIOViewController.h"

@interface SIOProfileViewController : SIOViewController
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray * rowTitles;

-(IBAction)didTapLogout;

@end
