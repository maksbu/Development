//
//  ViewController.m
//  HypnoNerd
//
//  Created by maksbu on 08.02.15.
//  Copyright (c) 2015 MAKSBU. All rights reserved.
//

#import "ViewController.h"
#import "LabeledView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
    // Create a view
    LabeledView *rootView1 = [[LabeledView alloc] init]; // а хренли мы вьюхе не задали размеры, но она растянулась на все окно?
    rootView1.backgroundColor = [UIColor blueColor];
    rootView1.textAlignment = NSTextAlignmentCenter;
    rootView1.text = @"rootView";
    //[self.window addSubview:rootView1];
    
    // Set it as *the* view of this view controller
    self.view = rootView1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
