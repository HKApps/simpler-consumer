//
//  Card+SIO.h
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "Card.h"

@interface Card (SIO)

+ (NSArray*) getAllCardsInContext: (NSManagedObjectContext *) ctx;
+ (Card *) getDefaultCard: (NSManagedObjectContext *) ctx;

@property (nonatomic,readonly) UIImage * cardImage;

@end
