//
//  MBViewController.m
//  Calc
//
//  Created by Mac on 06.12.13.
//  Copyright (c) 2013 maksbu. All rights reserved.
//

#import "MBViewController.h"

@interface MBViewController ()

@end

@implementation MBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clear:(id)sender {
    
}

- (IBAction)clearAll:(id)sender {
    x = 0;
    y = 0;
    [self calcScreen];
}

- (IBAction)number:(id)sender {
    if (enterFlag) {
        y = x;
        x = 0;
        enterFlag = NO;
    }
    x = (10.0f * x) + [sender tag];
    [self calcScreen];
}

- (IBAction)operation:(id)sender {
    operation = [sender tag];
    //NSLog(@"%i", operation);
    
    if (operation == 1001) {
        x = y + x;
        enterFlag = YES;
    }
    if (operation == 1002) {
        x = y - x;
        enterFlag = YES;
    }
    if (operation == 1003) {
        x = y * x;
        enterFlag = YES;
    }
    if (operation == 1004) {
        x = y / x;
        enterFlag = YES;
    }
    if (operation == 1005) {
        x = y / x;
        enterFlag = YES;
    }
    
    [self calcScreen];
}

- (void)calcScreen {
    NSString *str = [NSString stringWithFormat: @"%g",x];
    [self.displayLabel setText:str];
}

@end
