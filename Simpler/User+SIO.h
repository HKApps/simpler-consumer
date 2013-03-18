//
//  User+SIO.h
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "User.h"

@interface User (SIO)

+ (User *) getCurrentUserInContext: (NSManagedObjectContext*) ctx;
+ (BOOL) passcodeLockEnabled: (NSManagedObjectContext*) ctx;

@end
