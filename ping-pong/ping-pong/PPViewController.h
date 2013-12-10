//
//  PPViewController.h
//  ping-pong
//
//  Created by Mac on 11.11.13.
//  Copyright (c) 2013 maksburo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *viewPaddle1;
@property (weak, nonatomic) IBOutlet UIView *viewPaddle2;
@property (weak, nonatomic) IBOutlet UIView *viewPuck;

- (void)touchesBegan;

@end
