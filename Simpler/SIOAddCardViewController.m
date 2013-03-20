//
//  SIOAddCardViewController.m
//  Simpler
//
//  Created by Snacks on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import "SIOAddCardViewController.h"
#import "SIOAddCardTableViewCell.h"
#import "Card+SIO.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import "SIOConstants.h"
#import "SIOUtil.h"

#define kCardNumber 1
#define kExpDate 2
#define kSecurtyCode 3
#define kZipCode 4
#define kMerchantName 5
#define k8DigitCode 6

@implementation SIOAddCardViewController

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
    
    //TODO: Lock UI
    
    //Initiate REST call
    //I.E. Send this data directly to the API without saving
    //Probably want to notify the user that an API call is happening
    //The below goes in the async callback
    
    NSDictionary * parameters = @{
                                  @"card_number" : [_values objectForKey:@"CardNumber"],
                                  @"cvv" : [_values objectForKey:@"SecurityCode"],
                                  @"expiration_date" : [_values objectForKey:@"ExpDate"]
                                  };
    
    //TODO: card_type and card_name are missing from the REST document
    
    AFHTTPClient * httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:SIO_REST_PATH]];
    httpClient.parameterEncoding = AFJSONParameterEncoding;
    NSMutableURLRequest * urlRequest = [httpClient requestWithMethod:@"POST" path:SIO_ADDCARD_PATH parameters:parameters];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:urlRequest
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                            
                                             Card * card = [NSEntityDescription
                                                            insertNewObjectForEntityForName:@"Card"
                                                            inManagedObjectContext:self->ctx];
                                            
                                             if(creditViewOnTop){
                                                 card.card_type = @"MasterCard";
                                             } else {
                                                 card.card_type = @"Gift";
                                             }
                                             card.last_four = @"9999"; // NSString chopping
                                             card.token = @"Token"; // This needs to come from the API
                                             card.name = @"No Name Specified"; // This needs to be set
                                             
                                             [self.navigationController popViewControllerAnimated:YES];
                                             
                                         }
                                         failure:^( NSURLRequest *request , NSURLResponse *response , NSError *error , id JSON ) {
                                             [SIOUtil httpError];
                                         }];
    [operation start];
    

    
 
}



#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"SIOAddCardTableViewCell";
    
    SIOAddCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SIOAddCardTableViewCell" owner:nil options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[SIOAddCardTableViewCell class]]) {
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
                cell.textField.keyboardType = UIKeyboardTypeNumberPad;
                break;
            }
            case 1:
            {
                cell.textField.placeholder = @"Exp. Date";
                cell.textField.tag = kExpDate;
                cell.textField.delegate = self;
                cell.textField.keyboardType = UIKeyboardTypeNumberPad;
                break;
            }
            case 2:
            {
                cell.textField.placeholder = @"Security Code";
                cell.textField.tag = kSecurtyCode;
                cell.textField.delegate = self;
                cell.textField.keyboardType = UIKeyboardTypeNumberPad;
                break;
            }
            case 3:
            {
                cell.textField.placeholder = @"Zip Code";
                cell.textField.tag = kZipCode;
                cell.textField.delegate = self;
                cell.textField.keyboardType = UIKeyboardTypeNumberPad;
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
                cell.textField.keyboardType = UIKeyboardTypeNumberPad;
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
