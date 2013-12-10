//
//  PPViewController.m
//  ping-pong
//
//  Created by Mac on 11.11.13.
//  Copyright (c) 2013 maksburo. All rights reserved.
//

#import "PPViewController.h"

@interface PPViewController ()

@end

@implementation PPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // maksbu code
    - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
    {
        NSLog(@"touchesBegan");
    }
    - (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
    {
        NSLog(@"touchesMoved");
    }
    - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
    {
        NSLog(@"touchesEnded");
    }
    - (void)touchesCancelled:(NSSet *)touches
withEvent:(UIEvent *)event
    {
        NSLog(@"touchesCancelled");
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
