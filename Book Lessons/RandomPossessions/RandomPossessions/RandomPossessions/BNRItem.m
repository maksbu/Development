//
//  BNRItem.m
//  RandomPossessions
//
//  Created by maksbu on 13.12.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (id)randomItem
{
    // Создание массива, включающего три прилагательных
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
    // Создание массива, включающего три существительных
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];
    // Индекс случайных прилагательного/существительного из списков
    // Примечание: оператор %, вызываемый оператором modulo, вычисляет
    // остаток. В результате adjectiveIndex получает случайное значение
    // в диапазоне от 0 до 2 включительно.
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    // Обратите внимание, что NSInteger является не объектом, а определением
    // типа "unsigned long"
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    int randomValue = rand() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10];
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    return newItem;
}

- (NSString *)description {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", itemName, serialNumber, valueInDollars, dateCreated];
    return descriptionString;
    }

- (id)init  {return [self initWithItemName:@"Item" valueInDollars:0 serialNumber:@""];}

- (id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber {
    // Вызов выделенного инициализатора суперкласса
    self = [super init];
    // Успешно ли завершен вызов?
    if (self) {
        // Присваивание начальных значений переменным экземпляра класса
        [self setItemName:name];
        [self setSerialNumber:sNumber];
        [self setValueInDollars:value];
        dateCreated = [[NSDate alloc] init];
        }
    // Возврат адреса только что инициализированного объекта
    return self;
    }

- (void)dealloc {
    NSLog(@"Destroyed: %@", self);
}

- (void)setContainedItem:(BNRItem *)i
{
    containedItem = i;
    // Если содержится данный элемент, включенному
    // элементу будет предоставлен указатель на его контейнер
    [i setContainer:self];
}
- (BNRItem *)containedItem {
    return containedItem;
}

- (void)setContainer:(BNRItem *)i {
    container = i;
}

- (BNRItem *)container {
    return container;
}

- (void)setItemName:(NSString *)str  {itemName = str;}
- (NSString *)itemName  {return itemName;}

- (void)setSerialNumber:(NSString *)str  {serialNumber = str;}
- (NSString *)serialNumber  {return serialNumber;}

- (void)setValueInDollars:(int)i  {valueInDollars = i;}
- (int)valueInDollars  {return valueInDollars;}

- (NSDate *)dateCreated  {return dateCreated;}

@end
