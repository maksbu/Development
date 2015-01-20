//
//  main.m
//  RandomPossessions
//
//  Created by maksbu on 10.12.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Создание объекта изменяемого массива, сохранение его
        // адреса в переменной items
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        BNRItem *backpack = [[BNRItem alloc] init];
        [backpack setItemName:@"Backpack"];
        //[items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc] init];
        [calculator setItemName:@"Calculator"];
        //[items addObject:calculator];
        
        [backpack setContainedItem:calculator];
        
        // Создадим один контейнер, инициализируем и выведем дискрипшн
        //BNRContainer *cont1 = [[BNRContainer alloc] init];
        //[cont1 addItem:[items objectAtIndex:0]];
        //NSLog(@"%@", cont1);
        
        

        items = nil;
        
    }
    return 0;
}
