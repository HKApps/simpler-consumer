//
//  Card+SIO.m
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import "Card+SIO.h"
#import "SIOUtil.h"

@implementation Card (SIO)

+ (NSArray*) getAllCardsInContext: (NSManagedObjectContext *) ctx {
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Card" inManagedObjectContext:ctx];
    
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"name" ascending:YES];
    NSArray* sortDescriptors = [[NSArray alloc] initWithObjects: sortDescriptor, nil];
    
     
    //NSPredicate *predicate = [NSPredicate predicateWithFormat: @"session == %@", session ];
    
    [request setEntity:entityDescription];
    [request setSortDescriptors:sortDescriptors];
    //[request setPredicate:predicate];
    
    NSError * error;
    NSArray *array = [ctx executeFetchRequest:request error:&error];
    if(error!=nil){
        [SIOUtil criticalError:error];
        return nil;
    }
    return array;

}

+ (NSArray *) getAllCardsMatchingString: (NSString*) searchString context: (NSManagedObjectContext *) ctx {
    
    if(!searchString || ![searchString length]){
        return [self getAllCardsInContext:ctx];
    }
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Card" inManagedObjectContext:ctx];
    
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"name" ascending:YES];
    NSArray* sortDescriptors = [[NSArray alloc] initWithObjects: sortDescriptor, nil];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"name CONTAINS[cd] %@", searchString ];
    
    [request setEntity:entityDescription];
    [request setSortDescriptors:sortDescriptors];
    [request setPredicate:predicate];
    
    NSError * error;
    NSArray *array = [ctx executeFetchRequest:request error:&error];
    if(error!=nil){
        [SIOUtil criticalError:error];
        return nil;
    }
    return array;

}


+ (Card *) getDefaultCard: (NSManagedObjectContext *) ctx {
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Card" inManagedObjectContext:ctx];
    [request setEntity:entityDescription];
    
     NSPredicate *predicate = [NSPredicate predicateWithFormat: @"isDefault == %@", [NSNumber numberWithBool: YES] ];
    [request setPredicate:predicate];
    
    
    NSError * error;
    NSArray *array = [ctx executeFetchRequest:request error:&error];
    if(error!=nil){
        [SIOUtil criticalError:error];
        return nil;
    }
    if([array count] != 1){
        [SIOUtil criticalErrorWithString:@"More than one default card found"];
        return nil;
    }
    return [array objectAtIndex:0];
    
}

- (UIImage*) cardImage {
    
    UIImage * image;
    
    if([self.card_type isEqualToString:@"American Express"]){
        image = [UIImage imageNamed:@"amex"];
    } else if ([self.card_type isEqualToString:@"Visa"]){
        image = [UIImage imageNamed:@"visa"];
    } else if ([self.card_type isEqualToString:@"MasterCard"]){
        image = [UIImage imageNamed:@"masterCard"];
    } else if ([self.card_type isEqualToString:@"Discover"]){
        image = [UIImage imageNamed:@"discover"];
    } else {
        image = [UIImage imageNamed:@"logo"];
    }
    
    return image;
}

@end
