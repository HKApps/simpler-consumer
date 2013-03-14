//
//  HPDTCardTableViewCell.h
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPDTCardTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel * cardName;
@property (nonatomic, strong) IBOutlet UILabel * cardType;
@property (nonatomic, strong) IBOutlet UILabel * cardDigits;
@property (nonatomic, strong) IBOutlet UIImageView * cardImage;

@end
