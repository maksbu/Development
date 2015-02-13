//
//  AppDelegate.m
//  HypnoNerd
//
//  Created by maksbu on 08.02.15.
//  Copyright (c) 2015 MAKSBU. All rights reserved.
//

#import "AppDelegate.h"
//#import "LabeledView.h"
#import "ViewController.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]; // Инициируем окно приложения

    
    ViewController *hvc = [[ViewController alloc] init];
    MainViewController *hvc = [[MainViewController alloc] init];
    self.window.rootViewController = hvc;
    
    // Инициализируем виды
//    LabeledView *rootView1 = [[LabeledView alloc] initWithFrame:self.window.bounds];
//    LabeledView *rootView2 = [[LabeledView alloc] initWithFrame:self.window.bounds];
//    LabeledView *firstView = [[LabeledView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    LabeledView *secondView = [[LabeledView alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
    
//    rootView1.backgroundColor = [UIColor redColor];
//    rootView1.textAlignment = NSTextAlignmentCenter;
//    rootView1.text = @"rootView";
//    rootView2.backgroundColor = [UIColor blueColor];
//    rootView2.textAlignment = NSTextAlignmentCenter;
//    rootView2.text = @"rootView";
//    firstView.backgroundColor = [UIColor orangeColor];
//    firstView.textAlignment = NSTextAlignmentCenter;
//    firstView.text = @"firstView";
//    secondView.backgroundColor = [UIColor greenColor];
//    secondView.textAlignment = NSTextAlignmentCenter;
//    secondView.text = @"secondView";
    
//    [self.window addSubview:rootView1];
//    [rootView addSubview:firstView];
//    [rootView addSubview:secondView];
    
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 40)];
//    label.text = @"Custom Label";
//    [label setFont:[UIFont boldSystemFontOfSize:16]];
//    [rootView addSubview:label];
    
    
    
    // self.window.backgroundColor = [UIColor blueColor]; // Зачем-то устанавливаем цвет бэкграунд окна
    [self.window makeKeyAndVisible]; // Делаем ключевым и видимым
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
