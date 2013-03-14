//
//  HPDTCardsViewController.m
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "HPDTCardsViewController.h"
#import "HPDTAppDelegate.h"
#import "HPDTCardTableViewCell.h"
#import "Card+HPDT.h"

@interface HPDTCardsViewController ()

@end

@implementation HPDTCardsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.dataSource = [(HPDTAppDelegate*)[[UIApplication sharedApplication] delegate] paymentCardsDatasource];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) reloadData {
    _cards = [Card getAllCardsInContext:self->ctx];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0){
        return [_cards count];
    } else {
        return 0;
    }
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"HPDTCardTableViewCell";
    
    HPDTCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"HPDTCardTableViewCell" owner:nil options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[HPDTCardTableViewCell class]]) {
                cell = currentObject;
                break;
            }
        }
    }
    Card * card = [_cards objectAtIndex:[indexPath row]];
    cell.cardDigits.text = card.last_four;
    cell.cardName.text = card.name;
    cell.cardType.text = card.type;
    //cell.cardImage.image = nil;
    
    return cell;
}


@end
