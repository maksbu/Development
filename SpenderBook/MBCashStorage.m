//
//  MBCashStorage.m
//  SpenderBook
//
//  Created by maksbu on 02.01.15.
//  Copyright (c) 2015 MAKSBU. All rights reserved.
//

#import "MBCashStorage.h"

@implementation MBCashStorage

@synthesize storageName;

- (NSString *)description {
    return storageName;
}

- (id)init  {
    return [self initWithItemName:@"хранилище"];
    // Когда можно будет создавать хранилища с помощью интерфейса
    // нужно будет вычислять и добавлять порядковый номер к названию
}

- (id)initWithItemName:(NSString *)name {
    // Вызов выделенного инициализатора суперкласса
    self = [super init];
    // Успешно ли завершен вызов?
    if (self) {
        [self setStorageName:name];
    }
    // Возврат адреса только что инициализированного объекта
    return self;
}


@end
