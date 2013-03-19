//
//  Card+SIO.h
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import "Card.h"

@interface Card (SIO)

+ (NSArray*) getAllCardsInContext: (NSManagedObjectContext *) ctx;
+ (NSArray*) getAllCardsMatchingString: (NSString*) searchString context: (NSManagedObjectContext *) ctx;
+ (Card *) getDefaultCard: (NSManagedObjectContext *) ctx;

@property (nonatomic,readonly) UIImage * cardImage;

@end
