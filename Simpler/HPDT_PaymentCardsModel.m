//
//  HPDT_PaymentCardsModel.m
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "HPDT_PaymentCardsModel.h"

@implementation HPDT_PaymentCardsModel


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0){
        return 1;
    } else
        return 0;
    }
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end
