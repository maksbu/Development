//
//  SettingsViewController.m
//  lab
//
//  Created by Mac on 09.06.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//

#import "SettingsViewController.h"
#import "GameViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"SettingsViewController is load");
}

- (IBAction)switchChanged:(UISwitch *) sender {
    BOOL setting = sender.isOn;
    //[self.switchSettingItem setOn:setting animated:YES];
    // блять, как передать сообщение другому контроллеру?
    [GameViewController refreshSettingsFields];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
