//
//  BNRContainer.h
//  RandomPossessions
//
//  Created by maksbu on 15.12.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//
// ------------------------------------------------------------------
// Создайте подкласс класса BNRItem с именем BNRContainer. Класс BNRContainer должен включать массив подэлементов, которые содержат экземпляры класса BNRItem.

// В результате вывода на консоль описания класса BNRContainer будет отображено
// имя контейнера,
// его значение, выраженное в долларах (сумма всех элементов контейнера плюс значение самого контейнера),
//а также список каждого включенного элемента BNRItem.

// Корректно созданный подкласс BNRContainer может включать экземпляры BNRContainer. Он также корректно отображает полную сумму и каждый содержащийся в нем элемент.

#import "BNRItem.h"

@interface BNRContainer : BNRItem {
    
    // Кроме переменных и методов родительского класса BNRItem
    // NSString *itemName; - теперь это имя контейнера
    // NSString *serialNumber;
    // int valueInDollars; - теперь это сумма стоимости каждого входящего элемента
    // NSDate *dateCreated;
    
    // добавляем
    NSMutableArray *includedItems; // Массив входящих элементов
}
//- (void)setItemName:(NSString *)str;
//- (NSString *)itemName;
//- (void)setSerialNumber:(NSString *)str;
//- (NSString *)serialNumber;
//- (void)setValueInDollars:(int)i;
//- (int)valueInDollars;
//- (NSDate *)dateCreated;
// Эти типа у нас уже есть от родителя

// Новые или обновленные методы
// добавляем метод расчета суммы входящих чтобы вызывать его при надобности?
// не, не надо, надо
// переопределить метод расчета суммы (получатель или установщик?)
// метод добавления нового входящего итема
- (void)addItem:(id)item;
// дескрипшн, который нам нужно выводить в консоль


@end
