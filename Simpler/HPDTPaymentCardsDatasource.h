//
//  HPDT_PaymentCardsModel.h
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPDTPaymentCardsDatasource : NSObject <UITableViewDataSource>
{
    NSManagedObjectContext * ctx;
}

@property (nonatomic, strong) NSArray * cards;


- (id) initWithContext: (NSManagedObjectContext*) context;

@end
