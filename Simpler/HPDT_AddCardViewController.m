//
//  HPDT_AddCardViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "HPDT_AddCardViewController.h"
#import "HPDTAddCardTableViewCell.h"

#define kCardNumber 1
#define kExpDate 2
#define kSecurtyCode 3
#define kZipCode 4
#define kMerchantName 5
#define k8DigitCode 6

@implementation HPDT_AddCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self->creditViewOnTop = YES;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _creditCardButton.selected = YES;
    _giftCardButton.selected = NO;
    [_dataContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_dataContainerView addSubview:_addCreditCardView];
    creditViewOnTop = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark IBActions

-(IBAction)didTapCreditCardButton:(id)sender{
    if(!creditViewOnTop){
        _creditCardButton.selected = YES;
        _giftCardButton.selected = NO;
        [_dataContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_dataContainerView addSubview:_addCreditCardView];
        creditViewOnTop = YES;
    }
    
    
}

-(IBAction)didTapGiftCardButton:(id)sender{
    if(creditViewOnTop){
        _creditCardButton.selected = NO;
        _giftCardButton.selected = YES;
        [_dataContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_dataContainerView addSubview:_addGiftCardView];
        creditViewOnTop = NO;
    }
    
}


#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"HPDTAddCardTableViewCell";
    
    HPDTAddCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"HPDTAddCardTableViewCell" owner:nil options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[HPDTAddCardTableViewCell class]]) {
                cell = currentObject;
                break;
            }
        }
    }
    if(creditViewOnTop){
        switch([indexPath row]){
            case 0:
            {
                cell.
                break;
            }
            case 1:
            {
                break;
            }
            case 2:
            {
                break;
            }
            case 3:
            {
                break;
            }
            default:
                break;
        }
    } else {
        
        switch([indexPath row]){
            case 0:
            {
                break;
            }
            case 1:
            {
                break;
            }
            default:
                break;
        }
    
    }

    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


@end
