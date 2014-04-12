//
//  GameView.m
//  PoolHallJungle
//
//  Created by Mac on 07.03.14.
//  Copyright (c) 2014 maksburo. All rights reserved.
//

#import "GameView.h"
#import "Line.h"

@implementation GameView

//- (void)drawRect:(CGRect)Rect
//{
//				CGContextRef ctx = UIGraphicsGetCurrentContext();
//				CGContextSetLineWidth(ctx, 5);
//				CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
//				//CGContextAddArc(ctx, 100, 100, 10, 0.0, M_PI * 2.0, YES);
//				//CGContextAddRect(ctx, bounds);
//				CGContextAddLineToPoint(ctx, Rect.origin.x, Rect.origin.y);
//				CGContextStrokePath(ctx);
//}



//- (id)initWithFrame:(CGRect)rect
//{
//				self = [super initWithFrame:rect];
//				if (self) {
//								linesInProcess = [[NSMutableDictionary alloc] init];
//								completeLines = [[NSMutableArray alloc] init];
//								[self setBackgroundColor:[UIColor whiteColor]];
//								[self setMultipleTouchEnabled:YES];
//								NSLog(@"initwi");
//				}
//				return self;
//}


- (void)makeLinesData {
				linesInProcess = [[NSMutableDictionary alloc] init];
				//completeLines = [[NSMutableArray alloc] init];
}

- (void)drawRect:(CGRect)rect
{
				CGContextRef context = UIGraphicsGetCurrentContext();
				CGContextSetLineWidth(context, 5.0);
				CGContextSetLineCap(context, kCGLineCapRound);
				// Рисование завершенных линий черным цветом
//				[[UIColor blackColor] set];
//				for (Line *line in completeLines) {
//								CGContextMoveToPoint(context, [line begin].x, [line begin].y);
//								CGContextAddLineToPoint(context, [line end].x, [line end].y);
//								CGContextStrokePath(context);
//				}
				// Рисование линий красным цветом (Не выполняйте
				// копирование и вставку предыдущего цикла;
				// имеется различие)
				[[UIColor redColor] set];
				for (NSValue *v in linesInProcess) {
								Line *line = [linesInProcess objectForKey:v];
								CGContextMoveToPoint(context, [line begin].x, [line begin].y);
								CGContextAddLineToPoint(context, [line end].x, [line end].y);
								CGContextStrokePath(context);
				}
}

- (void)clearAll
{
				// Очистка коллекций
				[linesInProcess removeAllObjects];
				[completeLines removeAllObjects];
    // Перерисовывание
				[self setNeedsDisplay];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
				NSLog(@"touch");
    for (UITouch *t in touches) {
        // Это двойной тап?
        if ([t tapCount] > 1) {
												[self clearAll];
												NSLog(@"clearall");
												return;
								}
								
							// Использование объекта прикосновения (упакован в NSValue) в качестве ключа
								NSValue *key = [NSValue valueWithNonretainedObject:t];
								// Создание класса Line для данного значения
								CGPoint loc = [t locationInView:self];
								Line *newLine = [[Line alloc] init];
								[newLine setBegin:loc];
								[newLine setEnd:loc];
								// Помещение пары в словарь
								[linesInProcess setObject:newLine forKey:key];
				}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
				// Обновление linesInProcess при перемещении пальца
				for (UITouch *t in touches) {
								// Загоняем данные в объект класса nsvalue, так как nsset работает только с объектами
								NSValue *key = [NSValue valueWithNonretainedObject:t];
								// Поиск линии для данного прикосновения
								Line *line = [linesInProcess objectForKey:key];
								// Обновление линии
								CGPoint loc = [t locationInView:self];
								[line setEnd:loc];
				}
				// Перерисовывание
				[self setNeedsDisplay];
}

- (void)endTouches:(NSSet *)touches
{
    // Удаление завершающих прикосновений из словаря
    for (UITouch *t in touches) {
								NSValue *key = [NSValue valueWithNonretainedObject:t];
								Line *line = [linesInProcess objectForKey:key];
								// Если двойной тап, 'line' примет значение nil,
								// не добавляйте ее в массив
								if (line) {
												//[completeLines addObject:line];
												[linesInProcess removeObjectForKey:key]; }
				}
    // Перерисовывание
				[self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
				[self endTouches:touches];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
				[self endTouches:touches];
}

@end
