//
//  SIOUtil.m
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import "SIOUtil.h"

@implementation SIOUtil

+ (void) criticalError: (NSError *) error {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Critical Error"
                          message: [error debugDescription]
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
    
}

+ (void) criticalErrorWithString: (NSString *) error {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Critical Error"
                          message: error
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
    
}


+ (void) httpError {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Communcation Error"
                          message: @"Error communicating with server."
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
    
}

+ (void) httpErrorWithString: (NSString *) error {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Communcation Error"
                          message: error
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
    
}


@end
