//
//  HPDT_AddCardTableViewCell.h
//  Simpler
//
//  Created by Snacks on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPDTAddCardTableViewCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UITextField * textField;

-(IBAction)didEndEnding:(id)sender;

@end
