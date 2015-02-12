//
//  MBSwitchViewController.h
//  View Switcher
//
//  Created by Mac on 24.09.13.
//  Copyright (c) 2013 maksburo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBYellowViewController;
@class MBBlueViewController;

@interface MBSwitchViewController : UIViewController

    @property (strong, nonatomic) MBYellowViewController *yellowViewController;

    @property (strong, nonatomic) MBBlueViewController *blueViewController;

    - (IBAction)switchViews:(id)sender;

@end
