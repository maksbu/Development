//
//  BNRContainer.m
//  RandomPossessions
//
//  Created by maksbu on 15.12.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//
//

#import "BNRContainer.h"

@implementation BNRContainer

- (NSString *)description {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"Contaner %@: summary worth $%d, contain %@", itemName, valueInDollars, includedItems];
    return descriptionString;
    }
// Теперь при запросе описания будет выдаваться эта строка

- (id)init  {
    // return [self initWithItemName:@"Item" valueInDollars:0 serialNumber:@""];
    includedItems = [[NSMutableArray alloc] init];
    [includedItems addObject:@"First Array Item"];
    [includedItems addObject:@"Second Array Item"];
    return self;
}

//- (id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber {
//    // Вызов выделенного инициализатора суперкласса
//    self = [super init];
//    // Успешно ли завершен вызов?
//    if (self) {
//        // Присваивание начальных значений переменным экземпляра класса
//        [self setItemName:name];
//        [self setSerialNumber:sNumber];
//        [self setValueInDollars:value];
//        dateCreated = [[NSDate alloc] init];
//    }
//    // Возврат адреса только что инициализированного объекта
//    return self;
//}


- (void)addItem:(id)item {
      [includedItems addObject:item];
}

@end
