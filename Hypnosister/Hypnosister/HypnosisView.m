//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Mac on 31.01.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

/* По умолчанию метод drawRect: не выполняет каких-либо действий, но с помощью подклассов UIView происходит его переопределение таким образом, что становится возможным создавать пользовательскую графику. */
- (void)drawRect:(CGRect)dirtyRect {
    /* Тип ссылки CGContextRef определяется как CGContext * — указатель на CGContext. Объект CGContext это структура, представляющая контекст рисования. (Суффикс Ref обеспечивает распознавание указателей на структуры C и указателей на объекты Objective-C.) В данном случае указатель ctx указывает на текущий контекст рисования. */
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    /* Изображение представления имеет тот же размер, который используется для его отображения на экране, то есть размер фрейма представления. Фрейм описывает размер представления относительно суперпредставления данного представления. Но пред- ставление не должно «знать» о своем суперпредставлении до тех пор, пока не придет время разместить его изображение на экране. Таким образом, существует отдельное свойство CGRect объекта UIView, именуемое bounds, которое сообщает представлению его размеры независимо от имеющегося суперпредставления. */
    
    CGRect bounds = [self bounds];
    
    /* Операции рисования, выполняемые в CGContextRef, должны ограничиваться прямоугольником bounds. В противном случае будет происходить обрезание этого прямо- угольника. Давайте нарисуем окружность с центром в прямоугольнике bounds. */
    
    // Определение центра в области прямоугольника bounds
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    // Радиус окружности примерно соответствует размеру представления
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
    // Толщина линии выбирается равной 10 пунктам
    CGContextSetLineWidth(ctx, 5);
    // Цвет линии должен быть серым (red/green/blue = 0.6, alpha = 1.0);
    CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    // Добавьте фигуру к контексту — не выполняется рисование фигуры
    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES);
    // Выполнение инструкций по рисованию; рисование текущей фигуры
    // с данным состоянием
    CGContextStrokePath(ctx);
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame]; if (self) {
        // Все HypnosisViews запускаются с очищенным фоновым цветом
        [self setBackgroundColor:[UIColor clearColor]]; }
    return self; }

@end
