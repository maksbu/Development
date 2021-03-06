//
//  WBAppDelegate.m
//  WasteBook
//
//  Created by Mac on 20.01.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//

#import "WBAppDelegate.h"
#import "HypnosisView.h"

@implementation WBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    /* Каждый экземпляр представления включает прямоугольник frame. Фрейм представления определяет размер представления и его позицию относительно суперпредставления. Фрейм представлен структурой CGRect и содержит элементы origin и size (рис. 6.6). Эти элементы также являются структурами. Элемент origin имеет тип CGPoint и включает два элемента типа float: x и y. Элемент size имеет тип CGSize и включает два элемента типа float: width и height. (Структура не является объектом Objective-C, поэтому ей невозможно отправлять сообщения и нельзя объявить ее в качестве указателя.) */
    // CGRect viewFrame = CGRectMake(160, 240, 100, 150);
    // HypnosisView *view = [[HypnosisView alloc] initWithFrame:viewFrame];
    
    // Создаем представление с размером окна
    HypnosisView *view = [[HypnosisView alloc] initWithFrame: [[self window] bounds]];
    // Посылаем сообщение окну создать подпредставление
    [[self window] addSubview:view];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
