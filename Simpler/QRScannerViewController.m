//
//  QRScannerViewController.m
//  Simpler
//
//  Created by Matthew Shultz on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "QRScannerViewController.h"

@interface QRScannerViewController ()

@property (nonatomic, retain) ZXCapture* capture;
//@property (nonatomic, retain) IBOutlet UILabel* decodedLabel;

- (NSString*)displayForResult:(ZXResult*)result;

@end

@implementation QRScannerViewController

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

- (void)viewWillUnload {

    self.capture = nil;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
  
    //self.decodedLabel = nil;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    self.capture = [[ZXCapture alloc] init];
    self.capture.delegate = self;
    self.capture.rotation = 90.0f;
    
    self.capture.camera = self.capture.back;
    
    self.capture.layer.frame = self.view.bounds;
    [self.view.layer addSublayer:self.capture.layer];
    //[self.view bringSubviewToFront:self.decodedLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (NSString*)displayForResult:(ZXResult*)result {
    NSString *formatString;
    switch (result.barcodeFormat) {
        case kBarcodeFormatAztec:
            formatString = @"Aztec";
            break;
            
        case kBarcodeFormatCodabar:
            formatString = @"CODABAR";
            break;
            
        case kBarcodeFormatCode39:
            formatString = @"Code 39";
            break;
            
        case kBarcodeFormatCode93:
            formatString = @"Code 93";
            break;
            
        case kBarcodeFormatCode128:
            formatString = @"Code 128";
            break;
            
        case kBarcodeFormatDataMatrix:
            formatString = @"Data Matrix";
            break;
            
        case kBarcodeFormatEan8:
            formatString = @"EAN-8";
            break;
            
        case kBarcodeFormatEan13:
            formatString = @"EAN-13";
            break;
            
        case kBarcodeFormatITF:
            formatString = @"ITF";
            break;
            
        case kBarcodeFormatPDF417:
            formatString = @"PDF417";
            break;
            
        case kBarcodeFormatQRCode:
            formatString = @"QR Code";
            break;
            
        case kBarcodeFormatRSS14:
            formatString = @"RSS 14";
            break;
            
        case kBarcodeFormatRSSExpanded:
            formatString = @"RSS Expanded";
            break;
            
        case kBarcodeFormatUPCA:
            formatString = @"UPCA";
            break;
            
        case kBarcodeFormatUPCE:
            formatString = @"UPCE";
            break;
            
        case kBarcodeFormatUPCEANExtension:
            formatString = @"UPC/EAN extension";
            break;
            
        default:
            formatString = @"Unknown";
            break;
    }
    
    NSString * content = [NSString stringWithFormat:@"Scanned!\n\nFormat: %@\n\nContents:\n%@", formatString, result.text];
    
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Scanned" message:content delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    
    return content;
}

#pragma mark - ZXCaptureDelegate Methods

- (void)captureResult:(ZXCapture*)capture result:(ZXResult*)result {
    if (result) {
        [self.capture stop];
        
        //We got a qrcode
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        
        NSLog(@"%@", result.text);
        //  merchant_id; merchant_processor_id; merchant_interchange_category; item1_name, item1_price, item1_quantity, item1_id
        //  i.e. 178394; 13940028395038; CPS / Supermarket Credit; espresso, 1.50, 3, 1234; breakfast burrito, $5.00, 1, 1237

        NSArray * components = [result.text componentsSeparatedByString:@"; "];
        NSString * merchant_id = [components objectAtIndex:0];
        NSString * merchant_processor_id = [components objectAtIndex:1];
        NSString * merchant_interchange_category = [components objectAtIndex:2];
        NSDictionary * partialDetails = @{@"merchant_id":merchant_id,
                                          @"merchant_processor_id":merchant_processor_id,
                                          @"merchant_interchange_category":merchant_interchange_category,
                                          };
        NSMutableArray * items = [NSMutableArray arrayWithCapacity:5];
        for(int i=3; i<[components count]; i++){
            NSArray * itemComponents = [[components objectAtIndex:i] componentsSeparatedByString:@", "];
            NSDictionary * itemDetails = @{@"name":[itemComponents objectAtIndex:0],
                                           @"price":[itemComponents objectAtIndex:1],
                                           @"quantity":[itemComponents objectAtIndex:2],
                                           @"id":[itemComponents objectAtIndex:3]
                                           };
            [items addObject:itemDetails];
            
        }
        NSMutableDictionary * ticketDetails = [NSMutableDictionary dictionaryWithDictionary:partialDetails];
        [ticketDetails setObject:items forKey:@"items"];
        
        NSLog(@"%@", ticketDetails.debugDescription);
        
    }
}

- (void)captureSize:(ZXCapture*)capture width:(NSNumber*)width height:(NSNumber*)height {
}


@end
