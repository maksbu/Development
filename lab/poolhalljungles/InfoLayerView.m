//
//  InfoView.m
//  PoolHallJungle
//
//  Created by Mac on 06.05.14.
//  Copyright (c) 2014 maksburo. All rights reserved.
//
//		В инфовью присылаем всю инфу, которую нужно отобразить и где,
//		а представление рисует что где нужно
//
//		Передаем "создай и отобрази лэйбл, с инфой и координатами, или если такой уже есть, то перерисуй с новыми данными"
//		Передаем "создай и нарисуй вектор с подписью, или если такой уже есть, то перерисуй с новыми данными"
//		Придется создать все объекты заранее
//
//		ball-coordinates, ball-dcoordinates, ball-V,
//		aimline-x1, aimline-y2, aimline

// если что-то изменилось записываем новые данные в информационный массив и просим обновить инфовью
// а инфовью отображает данные из инфомассива
// Перенесем, кстати, сюда лайндату, а в геймвью будем рисовать прицельную линию, пока от центра шара
//
//
//
//
//

#import "InfoLayerView.h"
#import "Line.h"

@implementation InfoLayerView

- (void)drawRect:(CGRect)rect {
				CGContextRef context = UIGraphicsGetCurrentContext();
				
				CGContextSetLineWidth(context, 3.0);
				[[UIColor redColor] set];
				for (NSValue *value in linesInProcess) {
								Line *line = [linesInProcess objectForKey:value];
								CGContextMoveToPoint(context, [line begin].x, [line begin].y);
								CGContextAddLineToPoint(context, [line end].x, [line end].y);
								CGContextStrokePath(context);
				}
				
				// Определяем параметры линий для шарика
				CGContextSetLineWidth(context, 2.0);
				[[UIColor grayColor] set];
				//[super ];
				//CGContextMoveToPoint(context, [_line begin].x, [line begin].y);
				//CGContextAddLineToPoint(context, [line end].x, [line end].y);
				CGContextStrokePath(context);
				}


- (void)makeLinesData {
				// Создаем словарь для хранения рисующихся линий (нахера?)
				//linesInProcess = [[NSMutableDictionary alloc] init];
				linesInProcess = [[NSMutableDictionary alloc] init];
				
				// Объявляем лэйблы для отображения значений начала и конца линии
				lineBeginPointLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
				lineEndPointLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        // Это двойной тап?
        if ([touch tapCount] > 1) { NSLog(@"Double-Tap"); return; }
								// Использование объекта прикосновения (упакован в NSValue) в качестве ключа
								NSValue *key = [NSValue valueWithNonretainedObject:touch];
								// Создание класса Line для данного значения
								CGPoint location = [touch locationInView:self];
								Line *newLine = [[Line alloc] init];
								[newLine setBegin:location]; [newLine setEnd:location];
								// Помещение пары в словарь
								[linesInProcess setObject:newLine forKey:key];
								//[super touchesBegan:touches withEvent:event]; // нахрена??? передаем касания родителю?
								
								// Выводим данные в лэйбл, размещаем лэйбл у начала линии и добавляем лэйбл во вью
								[lineBeginPointLabel setText:[NSString stringWithFormat:@"x=%i y=%i", (int)location.x, (int)location.y]];
								[lineBeginPointLabel setCenter:location];
								[self addSubview:lineBeginPointLabel];
				}}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
				// Обновление linesInProcess при перемещении пальца
				for (UITouch *touch in touches) {
								// Загоняем данные в объект класса nsvalue, так как nsset работает только с объектами
								NSValue *key = [NSValue valueWithNonretainedObject:touch];
								// Поиск линии для данного прикосновения
								Line *line = [linesInProcess objectForKey:key];
								// Обновление линии
								CGPoint location = [touch locationInView:self];
								[line setEnd:location];
								
								// Выводим данные в лэйбл, размещаем лэйбл у конца линии и добавляем лэйбл во вью
								[lineEndPointLabel setText:[NSString stringWithFormat:@"x=%i y=%i", (int)location.x, (int)location.y]];
								[lineEndPointLabel setCenter:location];
								[self addSubview:lineEndPointLabel];
				}
				// Перерисовывание
				[self setNeedsDisplay];
}

// Функция вызывается при отпускании пальца или при любом сбое
- (void)endTouches:(NSSet *)touches {
    // Удаление завершающих прикосновений из словаря
    for (UITouch *t in touches) {
								NSValue *key = [NSValue valueWithNonretainedObject:t];
								Line *line = [linesInProcess objectForKey:key];
								// Если двойной тап, 'line' примет значение nil,
								// не добавляйте ее в массив
								if (line) {
												[linesInProcess removeObjectForKey:key]; }
								// Перерисовывание
								[self setNeedsDisplay];
								
								// Удаляем лэйблы из вью
								[lineBeginPointLabel removeFromSuperview];
								[lineEndPointLabel removeFromSuperview]; }
				}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
				[self endTouches:touches];
				}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
				[self endTouches:touches]; }

@end
