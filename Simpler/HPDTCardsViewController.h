//
//  HPDTCardsViewController.h
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPDTViewController.h"

@interface HPDTCardsViewController : HPDTViewController
<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) NSArray * cards;

@property (nonatomic, strong) IBOutlet UITableView * tableView;

@end
