//
//  HPDT_AddCardTableViewCell.m
//  Simpler
//
//  Created by Snacks on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "HPDTAddCardTableViewCell.h"

@implementation HPDTAddCardTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


-(IBAction)didEndEnding:(id)sender {
    [sender resignFirstResponder];
}
@end
