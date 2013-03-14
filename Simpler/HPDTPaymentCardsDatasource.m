//
//  HPDT_PaymentCardsModel.m
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "HPDTPaymentCardsDatasource.h"
#import "HPDTCardTableViewCell.h"
#import "Card+HPDT.h"

@implementation HPDTPaymentCardsDatasource

- (id) initWithContext: (NSManagedObjectContext*) context {
    self = [self init];
    
    self->ctx = context;
 

    [self reloadData];
    return self;
}

- (void) reloadData {
    _cards = [Card getAllCardsInContext:self->ctx];
}




@end
