//
//  WBViewController.m
//  WasteBook
//
//  Created by Mac on 20.01.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//

#import "WBViewController.h"

@interface WBViewController ()

@end

@implementation WBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // WASTEBOOK
    // устанавливаем значения массива данных таблицы
	self.wastesDataArray = @[@"Авоська", @"Ашан", @"Саше"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// HYPNOSISTER

// WASTEBOOK
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.wastesDataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    cell.textLabel.text = self.wastesDataArray[indexPath.row];
    return cell;
}

@end
