//
//  MBViewController.h
//  InstaMail
//
//  Created by Mac on 14.12.13.
//  Copyright (c) 2013 maksbu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBViewController : UIViewController

<UIPickerViewDataSource, UIPickerViewDelegate> {
    NSArray* who;
    NSArray* character1;
    NSArray* character2;
}

@property (weak, nonatomic) IBOutlet UIPickerView *characterPicker;

- (IBAction)sendButtonTapped:(id)sender;

@end
