//
//  SIOUtil.h
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIOUtil : NSObject

+ (void) criticalError: (NSError *) error;
+ (void) criticalErrorWithString: (NSString *) error;
+ (void) httpError;
+ (void) httpErrorWithString: (NSString *) error;
@end
