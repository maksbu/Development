//
//  MBCashStorage.h
//  SpenderBook
//
//  Created by maksbu on 02.01.15.
//  Copyright (c) 2015 MAKSBU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBCashStorage : NSObject

@property (nonatomic, strong) NSString *storageName;
@property (nonatomic, strong) NSMutableArray *transactionItems;
@property (nonatomic, strong) NSMutableArray *transactionDates;
// а дескрипшн переопределим для выдачи суммы

- (id)initWithItemName:(NSString *)name;

@end
