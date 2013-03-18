//
//  HPDT_AddCardTableViewCell.m
//  Simpler
//
//  Created by Snacks on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "SIOAddCardTableViewCell.h"

@implementation SIOAddCardTableViewCell

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

- (void) awakeFromNib
{
    [super awakeFromNib];
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(didTapCancelButton:)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(didTapApplyButton:)],
                           nil];
    [numberToolbar sizeToFit];
    _textField.inputAccessoryView = numberToolbar;
}

-(void)didTapApplyButton:(id)sender {
    [_textField resignFirstResponder];
}

-(void)didTapCancelButton:(id)sender {
    [_textField resignFirstResponder];
}

-(IBAction)didEndEnding:(id)sender {
    [sender resignFirstResponder];
}


@end
