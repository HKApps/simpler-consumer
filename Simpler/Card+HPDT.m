//
//  Card+HPDT.m
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "Card+HPDT.h"
#import "HPDTUtil.h"

@implementation Card (HPDT)

+ (NSArray*) getAllCardsInContext: (NSManagedObjectContext *) ctx {
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Card" inManagedObjectContext:ctx];
    
    /*
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"timestamp" ascending:YES];
    NSArray* sortDescriptors = [[NSArray alloc] initWithObjects: sortDescriptor, nil];
    */
     
    //NSPredicate *predicate = [NSPredicate predicateWithFormat: @"session == %@", session ];
    
    [request setEntity:entityDescription];
    //[request setSortDescriptors:sortDescriptors];
    //[request setPredicate:predicate];
    
    NSError * error;
    NSArray *array = [ctx executeFetchRequest:request error:&error];
    if(error!=nil){
        [HPDTUtil criticalError:error];
    }
    return array;

    
}


@end
