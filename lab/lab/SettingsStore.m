//
//  SettingsStore.m
//  lab
//
//  Created by Mac on 11.06.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//

#import "SettingsStore.h"

@implementation SettingsStore

- (NSString *)itemArchivePath {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // Получение из списка только каталога документа
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
    // стр. 313
}

@end
