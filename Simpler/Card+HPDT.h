//
//  Card+HPDT.h
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "Card.h"

@interface Card (HPDT)

+ (NSArray*) getAllCardsInContext: (NSManagedObjectContext *) ctx;

@end
