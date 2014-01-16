//
//  MBViewController.m
//  InstaMail
//
//  Created by Mac on 14.12.13.
//  Copyright (c) 2013 maksbu. All rights reserved.
//

#import "MBViewController.h"

@interface MBViewController ()

@end

@implementation MBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    who = [[NSArray alloc] initWithObjects:@"Пузи", @"Никсель", @"Мамчик", @"Папчик", @"Мусян", @"Мася", nil];
    character1 = [[NSArray alloc] initWithObjects:@"уже большой", @"смешной", @"страшный", @"красивый", @"пушистый", @"пугливый", nil];
    character2 = [[NSArray alloc] initWithObjects:@"храбрый", @"бублик", @"мягкий", @"сильный", @"наглый", @"гладкий", nil];
    
}

#pragma mark -
#pragma mark Picker Datasource Protocol

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [who count];
    }
    else if (component == 1) {
        return [character1 count];
    }
    else {
        return [character2 count];
    }
}

#pragma mark -
#pragma mark Picker Delegare Protocol

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [who objectAtIndex:row];
    }
    else if (component == 1) {
        return [character1 objectAtIndex:row];
    }
    else {
        return [character2 objectAtIndex:row];
    }
    return nil;
}

- (IBAction)sendButtonTapped:(id)sender {
    
    NSString* theMessage = [NSString stringWithFormat:@"%@ - %@ и очень %@",
                            [who objectAtIndex:[_characterPicker selectedRowInComponent:0]],
                            [character1 objectAtIndex:[_characterPicker selectedRowInComponent:1]],
                            [character2 objectAtIndex:[_characterPicker selectedRowInComponent:2]]];
    NSLog(@"%@", theMessage);
}
@end
