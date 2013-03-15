//
//  HPDT_AddCardViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import "HPDT_AddCardViewController.h"
#import "HPDTAddCardTableViewCell.h"
#import "Card+HPDT.h"

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
        _values = [NSMutableDictionary dictionaryWithCapacity:6];
        _keys = @[@"CardNumber", @"ExpDate", @"SecurityCode", @"ZipCode", @"MerchantName", @"8DigitCode"];
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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    _creditCardButton.selected = YES;
    _giftCardButton.selected = NO;
    [_dataContainerView addSubview:_addCreditCardView];
    creditViewOnTop = YES;
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
        [_addGiftCardView removeFromSuperview];
        [_dataContainerView addSubview:_addCreditCardView];
        creditViewOnTop = YES;
    }
    
    
}

-(IBAction)didTapGiftCardButton:(id)sender{
    if(creditViewOnTop){
        _creditCardButton.selected = NO;
        _giftCardButton.selected = YES;
        [_addCreditCardView removeFromSuperview];
        [_dataContainerView addSubview:_addGiftCardView];
        creditViewOnTop = NO;
    }
    
}



-(IBAction)didTapAddCardButton:(id)sender{
    
    
    //Initiate REST call
    //I.E. Send this data directly to the API without saving
    //Probably want to notify the user that an API call is happening
    //The below goes in the async callback
    
    Card * card = [[Card alloc] init];
    if(creditViewOnTop){
        card.type = @"MasterCard";
    } else {
        card.type = @"Gift";
    }
    card.last_four = @"9999"; //from API?
    card.token = @"Token";
    card.name = @"No Name Specified";
    
    [self.navigationController popViewControllerAnimated:YES];
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
                cell.textField.placeholder = @"Card #";
                cell.textField.tag = kCardNumber;
                cell.textField.delegate = self;
                break;
            }
            case 1:
            {
                cell.textField.placeholder = @"Exp. Date";
                cell.textField.tag = kExpDate;
                cell.textField.delegate = self;
                break;
            }
            case 2:
            {
                cell.textField.placeholder = @"Security Code";
                cell.textField.tag = kSecurtyCode;
                cell.textField.delegate = self;
                break;
            }
            case 3:
            {
                cell.textField.placeholder = @"Zip Code";
                cell.textField.tag = kZipCode;
                cell.textField.delegate = self;
                break;
            }
            default:
                break;
        }
    } else {
        
        switch([indexPath row]){
            case 0:
            {
                cell.textField.placeholder = @"Merchant Name";
                cell.textField.tag = kMerchantName;
                cell.textField.delegate = self;
                break;
            }
            case 1:
            {
                cell.textField.placeholder = @"8 Digit Code";
                cell.textField.tag = k8DigitCode;
                cell.textField.delegate = self;
                break;
            }
            default:
                break;
        }
    
    }

    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int numberOfRows = 4;
    if(!creditViewOnTop)
        numberOfRows = 2;
    return numberOfRows;
}

#pragma mark UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [_values setObject:textField.text forKey:[_keys objectAtIndex:textField.tag]];
}


@end
