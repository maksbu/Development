//
//  MBViewController.m
//  Sandbox
//
//  Created by Mac on 21.12.13.
//  Copyright (c) 2013 maksbu. All rights reserved.
//

#import "MBViewController.h"

@interface MBViewController ()

@end

@implementation MBViewController

@synthesize bomb;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*
     объект бомб
     
     
     */
    // UIImage *bomb = [[UIImage alloc] init];
    // [bomb ]
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//---------- busya code ----------//
- (void)updateLabelsFromTouches:(NSSet *)touches {
    NSUInteger numTaps = [[touches anyObject] tapCount];
    NSString *tapMessage = [[NSString alloc]
                            initWithFormat:@"%d taps detected", numTaps];
    self.tapsLabel.text = tapMessage;
    
    NSUInteger numTouches = [touches count];
    NSString *touchMsg = [[NSString alloc] initWithFormat:@"%d touches detected", numTouches];
    self.touchesLabel.text = touchMsg;
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.messageLabel.text = @"Touches Began";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    self.messageLabel.text = @"Touches Canseled";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.messageLabel.text = @"Touches Ended";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    self.messageLabel.text = @"Drag Detcted";
    [self updateLabelsFromTouches:touches];
    
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
    CGPoint touchLocation = [touch locationInView:self.view];
    
    if (touch.view == bomb) {
        bomb.center = touchLocation;
    }
}


@end
