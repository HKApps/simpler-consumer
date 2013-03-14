//
//  User+HPDT.h
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "User.h"

@interface User (HPDT)

+ (User *) getCurrentUserInContext: (NSManagedObjectContext*) ctx;
+ (BOOL) passcodeLockEnabled: (NSManagedObjectContext*) ctx;

@end
