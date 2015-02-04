//
//  GameView.m
//  PoolHallJungle
//
//  Created by Mac on 07.03.14.
//  Copyright (c) 2014 maksburo. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (void)drawRect:(CGRect)dirtyRect
{
				
    CGContextRef ctx = UIGraphicsGetCurrentContext();
				
    CGRect bounds = [self bounds];
    /* Операции рисования, выполняемые в CGContextRef, должны ограничиваться прямоугольником bounds. В противном случае будет происходить обрезание этого прямоугольника. */
    
    // Определение центра в области прямоугольника bounds
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    // Радиус окружности примерно соответствует размеру представления
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    // Толщина линии выбирается равной 10 пунктам
    CGContextSetLineWidth(ctx, 10);
    /* Существует ряд классов Foundation и UIKit, которые могут работать вместе с CGContextRef. Например экземпляр класса UIColor предоставляет цвет и может использовать для установки цвета контекста текущего рисунка. */
    // можно так CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    // можно так [[UIColor lightGrayColor] setStroke];
    [[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1] setStroke];
    // Добавьте фигуру к контексту — не выполняется рисование фигуры
				//CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES);
    // Выполнение инструкций по рисованию;
    //рисование текущей фигуры с данным состоянием
				//CGContextStrokePath(ctx);
    // Рисование концентрических окружностей от центра
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        // Добавление контура в контекст
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        // Выполнение инструкции рисования; удаление контура
        CGContextStrokePath(ctx);
    }
    
    // Создание строки
    NSString *text = @"Спа-а-а-а-ть";
    // Получение шрифта для его рисования
    //CGSize textSize = [text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0] }];
    //UIFont *font = [UIFont boldSystemFontOfSize:28];
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:28];
    CGRect textRect;
    // Насколько велика строка при рисовании этим шрифтом?
    textRect.size.width = 500; textRect.size.height=500; //[text sizeWithFont:font];
    CGSize textSize = [text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0] }];
    
    NSLog(@"width = %f, height = %f", textSize.width, textSize.height);
    //NSLog(@"blya");
    
    //textRect = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    //textRect.size = textSize;
    
    
    // Поместим строку в центре представления
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    // Выбор черного цвета заливки для текущего контекста
    [[UIColor blackColor] setFill];
    // Тень смещается на 4 точки вправо и 3 точки // вниз от текста
    //CGSize offset = CGSizeMake(4, 3);
    // Тень будет окрашена в темно-серый цвет
    //CGColorRef color = [[UIColor darkGrayColor] CGColor];
    // Установите тень контекста с помощью данных параметров,
    // все последующие рисунки будут с эффектом тени
    //CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    // Рисование строки
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:font, NSFontAttributeName, nil];
    [text drawInRect:textRect withAttributes:dictionary];
    
    // Рисуем рамку текстового блока.
    // Толщина линии выбирается равной 10 пунктам
    CGContextSetLineWidth(ctx, 3);
    // Добавляем контур в контекст
    CGContextAddRect(ctx, textRect);
    // Выполнение инструкции рисования; удаление контура
    CGContextStrokePath(ctx);
}

@end
