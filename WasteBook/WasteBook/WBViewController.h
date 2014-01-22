//
//  WBViewController.h
//  WasteBook
//
//  Created by Mac on 20.01.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBViewController : UIViewController

    <UITableViewDataSource, UITableViewDelegate>
    @property (copy, nonatomic) NSArray *wastesDataArray;

@end
