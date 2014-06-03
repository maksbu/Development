//
//  HomeViewController.m
//  applab
//
//  Created by Mac on 29.05.14.
//  Copyright (c) 2014 maksburo. All rights reserved.
//

#import "HomeViewController.h"
#import "HypnosisView.h"

@implementation HomeViewController

- (void)loadView
{
    // Создание представления
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *view = [[HypnosisView alloc] initWithFrame:frame];
    // Установка его в качестве представления *the* данного контроллера представления
    [self setView:view];
}

- (void)viewDidLoad {
    NSLog(@"ok");
}

@end
