//
//  SIOLoginViewController.h
//  Simpler
//
//  Created by Matthew Shultz on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIOAppDelegate.h"

@interface SIOLoginViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField * emailAddress;
@property (nonatomic, strong) IBOutlet UITextField * password;


- (IBAction)loginButtonAction:(id)sender;
- (IBAction)doneEditing:(id)sender;
- (IBAction)facebookAuthButtonAction:(id)sender;
- (IBAction)didTapRegisterButton:(id)sender;

@end
