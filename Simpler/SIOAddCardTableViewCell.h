//
//  SIOAddCardTableViewCell.h
//  Simpler
//
//  Created by Snacks on 3/13/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SIOAddCardTableViewCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UITextField * textField;

-(IBAction)didEndEnding:(id)sender;

@end
