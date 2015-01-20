//
//  SettingsViewController.h
//  lab
//
//  Created by Mac on 09.06.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *switchSettingItem;

- (IBAction)switchChanged:(id)sender;

@end
