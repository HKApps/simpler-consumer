//
//  SIOCardsViewController.m
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import "SIOCardsViewController.h"
#import "SIOAppDelegate.h"
#import "SIOCardTableViewCell.h"
#import "SIOEditCardViewController.h"

@interface SIOCardsViewController ()

@end

@implementation SIOCardsViewController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadData];
    [_tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) reloadData {
    _cards = [Card getAllCardsInContext:self->ctx];
}

- (void) pushEditCardView: (Card *) card {
    
    SIOEditCardViewController * editCardViewController = [[SIOEditCardViewController alloc] init];
    editCardViewController.title = @"Edit Card";
    editCardViewController.card = card;
    [self.navigationController pushViewController:editCardViewController animated:YES];
    //self.navigationController.navigationBarHidden = NO;
    
}

#pragma mark UITableViewDelegate


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
    static NSString *CellIdentifier = @"SIOCardTableViewCell";
    
    SIOCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SIOCardTableViewCell" owner:nil options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[SIOCardTableViewCell class]]) {
                cell = currentObject;
                break;
            }
        }
    }
    Card * card = [_cards objectAtIndex:[indexPath row]];
    cell.cardDigits.text = card.last_four;
    cell.cardName.text = card.name;
    cell.cardType.text = card.card_type;
    cell.cardImage.image = card.cardImage;
    
    return cell;
}


@end
