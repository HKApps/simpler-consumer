//
//  HPDT_PaymentCardsModel.m
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "HPDTPaymentCardsDatasource.h"
#import "HPDT_CardTableViewCell.h"


@interface HPDTPaymentCardsDatasource ()

- (int) numberOfCards;

@end

@implementation HPDTPaymentCardsDatasource

- (int) numberOfCards {
    //mocking the data
    return 4;
}



#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0){
        return [self numberOfCards];
    } else {
        return 0;
    }
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CardTableViewCell";
    
    HPDT_CardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CardTableViewCell" owner:nil options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[HPDT_CardTableViewCell class]]) {
                cell = currentObject;
                break;
            }
        }
    }
    return cell;
}


@end
