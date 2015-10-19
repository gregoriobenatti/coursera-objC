//
//  ViewController.m
//  coursera-objC-week01
//
//  Created by Gregório Benatti on 26/09/15.
//  Copyright © 2015 Gregorio Benatti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *theLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testButtonTapped:(id)sender {
    self.theLabel.text = @"It worked!";
}

@end
