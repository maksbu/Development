//
//  PHJGameViewController.m
//  PoolHallJungle
//
//  Created by Mac on 09.03.14.
//  Copyright (c) 2014 maksburo. All rights reserved.
//

#import "GameViewController.h"

@implementation GameViewController

int tblX1, tblY1, tblX2, tblY2;
float dx, dy, speed, ds;
NSTimer *timer;
CGPoint sightingLineBegin, sightingLineEnd;

NSString *stringToDisplay;




// variables for sighting line


// объявляем размеры стола

// TODO шарик должен брать габариты стола для расчета отскока DONE

// TODO Пуск шарика пока по тапу, остановка когда он прекратит движение. Игнорировать тап пока он не остановится шарик.

// TODO Считывание направления свайпа и запуск шарика в направлении свайпа
				// Считать точку прикосновения и точку убирания пальца, получаем угол запуска
				// На основе этого рассчитать параметры dx и dy


- (void)viewDidLoad
{
    [super viewDidLoad];
				[self reset];
				[self start];
				
				[_mainGameView makeLinesData];
				
}

- (void)reset
{
				// TODO задать размеры стола
				// Получаем габариты стола
				CGRect poolTableBounds = [_poolTable bounds];
				tblX1 = poolTableBounds.origin.x;
				tblY1 = poolTableBounds.origin.y;
				tblX2 = poolTableBounds.size.width;
				tblY2 = poolTableBounds.size.height;
				
    // задаем направление мячика
				dx = 1.0;
				dy = -0.01;
				// перемещаем точку в случайное положение в области центра
				_ball.center = CGPointMake(300, 300);
				// сбрасываем скорость
				speed = 3;
				ds = 0.003;
				
				// пишем все в лэйбл
				stringToDisplay = [NSString stringWithFormat:@"dx=%f",dx];
				_display.text = stringToDisplay;
				
				//NSLog(@"tx = %i, ty = %i", tx, ty);
}

- (void)animate
{
				// проверка столкновения мячика c границами стола
				if ((_ball.center.x > tblX2 - 15) || (_ball.center.x < tblX1 + 15)) {
								dx = -dx;
								speed = speed - ds*5;
				}
				if ((_ball.center.y > tblY2 - 15) || (_ball.center.y < tblY1 + 15)) {
								dy = -dy;
				}

				
				if ( speed <= 0 ) {
								[self stop];
								//NSLog(@"stop");
				}
				
				//замедляем шарик
				speed = speed - ds;
				
				//NSLog(@"ds = %f", ds);
				
				// перемещаем мячик в новую позицию в зависимости от направления и скорости движения
    _ball.center = CGPointMake(_ball.center.x + dx*speed,	_ball.center.y + dy*speed);
				
				stringToDisplay = [NSString stringWithFormat:@"x=%f\ny=%f\ndx=%f\ndy=%f\nspeed=%f", _ball.center.x, _ball.center.y, dx , dy, speed];
				[_display setText:stringToDisplay];
				[_debugTextView setText:stringToDisplay];

}

- (void)start
{
    if (timer == nil)
    {
								//создаем анимационный таймер
								timer = [NSTimer
																		scheduledTimerWithTimeInterval: 1.0/60.0
																		target: self
																		selector: @selector(animate)
																		userInfo: NULL
																		repeats: YES];
				}
				// отображаем мячик
				_ball.hidden = NO;
}

- (void)stop

{
				if (timer != nil)
				{
								[timer invalidate];
								timer = nil;
				}
				// скрываем мячик
				//_ball.hidden = YES;
}





//// Обрабатываем мультитач и рисуем прицельную линию
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//				//NSLog(@"touchesBegan");
//				// создаем переменные для записи начальной и конечной точки,
//				//
//				// перебираем все элементы касания
//				for (UITouch *touch in touches)
//				{
//								// получаем точку касания в пределах вида
//								sightingLineBegin = [touch locationInView: self.view];
//								NSLog(@"x1 = %f, y1 = %f", sightingLineBegin.x, sightingLineBegin.y);
//					}
//}
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//				//NSLog(@"touchesMoved");
//				// перебираем все элементы касания
//				for (UITouch *touch in touches)
//				{
//								// получаем точку касания в пределах вида
//								sightingLineEnd = [touch locationInView: self.view];
//								NSLog(@"x2 = %f, y2 = %f", sightingLineEnd.x, sightingLineEnd.y);
//								CGRect rectForGameView;
//								rectForGameView.origin.x = sightingLineBegin.x;
//								rectForGameView.origin.y = sightingLineBegin.y;
//								rectForGameView.size.width = sightingLineEnd.x;
//								rectForGameView.size.height = sightingLineEnd.y;
//								[_mainGameView drawRect:rectForGameView];
//				}
//}
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//				//NSLog(@"touchesEnded");
//}
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
//{
//				//NSLog(@"touchesCancelled");
//}


@end
