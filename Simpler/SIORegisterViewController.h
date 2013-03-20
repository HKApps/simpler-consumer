//
//  SIORegisterViewController.h
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIOViewController.h"

@interface SIORegisterViewController : SIOViewController

@property (nonatomic, strong) IBOutlet UITextField * emailAddress;
@property (nonatomic, strong) IBOutlet UITextField * password;


- (IBAction) didTapSignUpButton: (id) sender;

@end
