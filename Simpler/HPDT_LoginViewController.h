//
//  HPDT_LoginViewController.h
//  Simpler
//
//  Created by Matthew Shultz on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPDTAppDelegate.h"

@interface HPDT_LoginViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField * emailAddress;
@property (nonatomic, strong) IBOutlet UITextField * password;


- (IBAction)loginButtonAction:(id)sender;
- (IBAction)facebookAuthButtonAction:(id)sender;

@end
