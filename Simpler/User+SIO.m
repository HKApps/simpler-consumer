//
//  User+SIO.m
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import "User+SIO.h"
#import "SIOUtil.h"

@implementation User (SIO)

+ (User *) getCurrentUserInContext: (NSManagedObjectContext*) ctx {
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"User" inManagedObjectContext:ctx];
    [request setEntity:entityDescription];
    
    NSError * error;
    NSArray *array = [ctx executeFetchRequest:request error:&error];
    if(error!=nil){
        [SIOUtil criticalError:error];
        return nil;
    }
    if(![array count]){
        [SIOUtil criticalErrorWithString:@"Current user not found"];
        return nil;
    }
    
    return [array objectAtIndex:0];
    
}

+ (BOOL) passcodeLockEnabled: (NSManagedObjectContext*) ctx {
    User * currentUser = [User getCurrentUserInContext:ctx];
    return currentUser.passcode_lock ? YES : NO;
}


@end
