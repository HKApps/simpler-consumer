//
//  Login.h
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Login : NSObject

+ (BOOL) validateLogin: (NSString*) username password:(NSString*) password;

@end
