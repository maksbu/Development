//
//  MBAppDelegate.h
//  View Switcher
//
//  Created by Mac on 24.09.13.
//  Copyright (c) 2013 maksburo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBSwitchViewController;

@interface MBAppDelegate : UIResponder <UIApplicationDelegate>

    @property (strong, nonatomic) UIWindow *window;
    @property (strong, nonatomic) MBSwitchViewController *switchViewController;

@end
