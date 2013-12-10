//
//  MBViewController.h
//  Calc
//
//  Created by Mac on 06.12.13.
//  Copyright (c) 2013 maksbu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;


- (IBAction)clear:(id)sender;
- (IBAction)clearAll:(id)sender;

- (IBAction)number:(id)sender;
- (IBAction)operation:(id)sender;

@end

// x введенное значение
// y предыдущее значение
double x, y;
NSInteger operation;
BOOL enterFlag;