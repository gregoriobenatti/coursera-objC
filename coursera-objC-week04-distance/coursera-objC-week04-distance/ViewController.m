//
//  ViewController.m
//  coursera-objC-week04-distance
//
//  Created by Gregório Benatti on 18/10/15.
//  Copyright © 2015 Gregorio Benatti. All rights reserved.
//

#import "ViewController.h"
#import <DistanceGetter/DGDistanceRequest.h>


@interface ViewController ()

@property (nonatomic) DGDistanceRequest *req;

@property (weak, nonatomic) IBOutlet UITextField *startLocation;

@property (weak, nonatomic) IBOutlet UITextField *endLocationA;
@property (weak, nonatomic) IBOutlet UILabel *distanceA;

@property (weak, nonatomic) IBOutlet UITextField *endLocationB;
@property (weak, nonatomic) IBOutlet UILabel *distanceB;

@property (weak, nonatomic) IBOutlet UITextField *endLocationC;
@property (weak, nonatomic) IBOutlet UILabel *distanceC;

@property (weak, nonatomic) IBOutlet UITextField *endLocationD;
@property (weak, nonatomic) IBOutlet UILabel *distanceD;

@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *unitController;

@end


@implementation ViewController

// function to find the distance between places...
void findDistance(NSArray *responses, NSNull *badResult, ViewController *strongSelf, int index){
    UILabel *distanceLabel;
    if (responses[index] != badResult) {
        if (index == 0)
            distanceLabel = strongSelf.distanceA;
        else if (index == 1)
            distanceLabel = strongSelf.distanceB;
        else if (index == 2)
            distanceLabel = strongSelf.distanceC;
        else if (index == 3)
            distanceLabel = strongSelf.distanceD;

        double toNum;
        NSString *resultFormatted;

        if (strongSelf.unitController.selectedSegmentIndex == 0){ //Km
            toNum = ([responses[index] floatValue]/1000.0);
            resultFormatted = [NSString stringWithFormat:@"%.2f Km", toNum];
        }else if (strongSelf.unitController.selectedSegmentIndex == 1){ //Meters
            toNum = ([responses[index] floatValue]);
            resultFormatted = [NSString stringWithFormat:@"%.2f m", toNum];
        }else if(strongSelf.unitController.selectedSegmentIndex == 2){ //Miles
            toNum = ([responses[index] floatValue]*0.0006213712);
            resultFormatted = [NSString stringWithFormat:@"%.2f miles", toNum];
        }
        distanceLabel.text = resultFormatted;
    } else {
        distanceLabel.text = @"Error";
    }
}

- (IBAction)calculateButtonTapped:(id)sender {
    self.calculateButton.enabled = NO;
    
    self.req = [DGDistanceRequest alloc];
    
    NSString *start = self.startLocation.text;
    NSString *destA = self.endLocationA.text;
    NSString *destB = self.endLocationB.text;
    NSString *destC = self.endLocationC.text;
    NSString *destD = self.endLocationD.text;
    
    NSArray *dests = @[destA, destB, destC, destD];
    
    self.req = [self.req initWithLocationDescriptions:dests sourceDescription:start];
    
    __weak ViewController *weakSelf = self;
    
    self.req.callback = ^(NSArray *responses){
        ViewController *strongSelf = weakSelf;
        
        if (!strongSelf)
            return;
        
        NSNull *badResult = [NSNull null];
        
        findDistance(responses, badResult, strongSelf, 0);
        findDistance(responses, badResult, strongSelf, 1);
        findDistance(responses, badResult, strongSelf, 2);
        findDistance(responses, badResult, strongSelf, 3);
        
        strongSelf.req = nil;
        strongSelf.calculateButton.enabled = YES;
    };
    
    [self.req start];
}

@end
