//
//  HPDT_AddCardViewController.h
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIOViewController.h"

@interface SIOAddCardViewController : SIOViewController
<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate> {
    BOOL creditViewOnTop;
}

@property (nonatomic,strong) NSArray * creditCardFieldNames;
@property (nonatomic,strong) NSArray * giftCardFieldNames;
@property (nonatomic,strong) NSMutableDictionary * values;
@property (nonatomic,strong) NSArray * keys;



@property (nonatomic,strong) IBOutlet UIView * dataContainerView;
@property (nonatomic,strong) IBOutlet UIView * addCreditCardView;
@property (nonatomic,strong) IBOutlet UIView * addGiftCardView;
@property (nonatomic,strong) IBOutlet UIButton * creditCardButton;
@property (nonatomic,strong) IBOutlet UIButton * giftCardButton;

-(IBAction)didTapCreditCardButton:(id)sender;
-(IBAction)didTapGiftCardButton:(id)sender;
-(IBAction)didTapAddCardButton:(id)sender;
@end
