//
//  ViewController.m
//  coursera-objC-week02-UnitConverter
//
//  Created by Gregório Benatti on 04/10/15.
//  Copyright © 2015 Gregorio Benatti. All rights reserved.
//

#import "ViewController.h"

// ft -> centimeters
double convertFootToCentimeters(double valueInFoot){
    double valueInCentimeters;
    valueInCentimeters = valueInFoot * 30.48;
    
    return valueInCentimeters;
}

// ft -> yard
double convertFootToYard(double valueInFoot){
    double valueInYard;
    valueInYard = valueInFoot * 0.333333;
    
    return valueInYard;
}

// ft -> inch
double convertFootToInch(double valueInFoot){
    double valueInInch;
    valueInInch = valueInFoot * 12;
    
    return valueInInch;
}

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

@property (weak, nonatomic) IBOutlet UILabel *outputField;


@end

@implementation ViewController

- (IBAction)updateButton:(id)sender {
    NSMutableString *buf = [NSMutableString new];

    double userInput = [self.inputField.text doubleValue];
    
    if (self.segmentController.selectedSegmentIndex == 0){
        double ftToCm = convertFootToCentimeters(userInput);
        [buf appendString:[@(ftToCm) stringValue]];
    }else if (self.segmentController.selectedSegmentIndex == 1){
        double ftToYard = convertFootToYard(userInput);
        [buf appendString:[@(ftToYard) stringValue]];
    }else {
        double ftToInch = convertFootToInch(userInput);
        [buf appendString:[@(ftToInch) stringValue]];
    }
    self.outputField.text = buf;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
