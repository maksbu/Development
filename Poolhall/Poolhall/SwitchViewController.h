//
//  SwitchViewController.h
//  PoolHallJungle
//
//  Created by Mac on 17.05.14.
//  Copyright (c) 2014 maksburo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GameViewController;
@class LabViewController;

@interface SwitchViewController : UIViewController

@property (strong, nonatomic) GameViewController *gameViewController;
@property (strong, nonatomic) LabViewController *labViewController;

- (IBAction)switchViews:(id)sender;

@end
