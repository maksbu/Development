//
//  MBViewController.h
//  Sandbox
//
//  Created by Mac on 25.11.13.
//  Copyright (c) 2013 buka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *slaiderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingButton;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;




- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundtap:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (IBAction)toggleControls:(UISegmentedControl *)sender;
- (IBAction)buttonPressed:(id)sender;

@end


