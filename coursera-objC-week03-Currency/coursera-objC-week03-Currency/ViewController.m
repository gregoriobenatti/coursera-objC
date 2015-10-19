//
//  ViewController.m
//  coursera-objC-week03-Currency
//
//  Created by Gregório Benatti on 12/10/15.
//  Copyright © 2015 Gregorio Benatti. All rights reserved.
//

#import "ViewController.h"
#import <CurrencyRequest/CRCurrencyRequest.h>
#import <CurrencyRequest/CRCurrencyResults.h>

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA; //Czech Koruna
@property (weak, nonatomic) IBOutlet UILabel *currencyB; //Danish krone
@property (weak, nonatomic) IBOutlet UILabel *currencyC; //Swedish Krona

@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}


- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled = YES;
    
    double inputValue = [self.inputField.text floatValue];

    //Czech Koruna
    double czk = inputValue * currencies.CZK;
    NSString *czkToString = [NSString stringWithFormat:@"%.2f", czk];
    
    //Danish krone
    double dkk = inputValue * currencies.DKK;
    NSString *dkkToString = [NSString stringWithFormat:@"%.2f", dkk];
    
    //Swedish Krona
    double sek = inputValue * currencies.SEK;
    NSString *sekToString = [NSString stringWithFormat:@"%.2f", sek];

    
    self.currencyA.text = czkToString;
    self.currencyB.text = dkkToString;
    self.currencyC.text = sekToString;
}


@end
