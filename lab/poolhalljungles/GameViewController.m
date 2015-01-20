//
//  PHJGameViewController.m
//  PoolHallJungle
//
//  Created by Mac on 09.03.14.
//  Copyright (c) 2014 maksburo. All rights reserved.
//

#import "GameViewController.h"

@implementation GameViewController

int tblX1, tblY1, tblX2, tblY2; // Переменные для
float dx, dy, speed, ds;
float Xres, Yres, speedLength, angleValue, angleValueInDegrees, touchdx, touchdy;

CGPoint drawLineBegin, drawLineEnd, sightingLineBegin, sightingLineEnd, ballCurrentLocation;

NSTimer *timer;
NSString *stringToDisplay;

// объявляем размеры стола
// TODO шарик должен брать габариты стола для расчета отскока DONE
// TODO Пуск шарика пока по тапу, остановка когда он прекратит движение. Игнорировать тап пока он не остановится шарик.
// TODO Считывание направления свайпа и запуск шарика в направлении свайпа
// Считать точку прикосновения и точку убирания пальца, получаем угол запуска
// На основе этого рассчитать параметры dx и dy


- (void)viewDidLoad {
	[super viewDidLoad];	//запускаем метод вьюдидлоад класса, в данном случае окна uiwindow?
	[self reset];			//запускаем метод ресет
	[self start];
	[_infoLayer makeLinesData];
    [self refreshSettingsFields];
    NSLog(@"GameViewController is load");
    }

- (void)refreshSettingsFields {
    //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //self.showInfoLayerLabel.text = [defaults objectForKey:kShowInfoLayerKey];
    NSLog(@"%@", self.showInfoLayerLabel.text);
    }

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self refreshSettingsFields];
    }

- (void)reset {
	// TODO задать размеры стола
	// Получаем габариты стола
	CGRect poolTableBounds = [_poolTable bounds];
	tblX1 = poolTableBounds.origin.x; tblY1 = poolTableBounds.origin.y;	tblX2 = poolTableBounds.size.width; tblY2 = poolTableBounds.size.height;
    // задаем направление мячика и скорость
	dx = 1.0; dy = -1; speed = 3; ds = 0.003;
	// перемещаем точку в случайное положение в области центра
	_ball.center = CGPointMake(300, 300);
	//[InfoView showObjectInfo:&_ball];
	}

- (void)animate {
	// проверка столкновения мячика c границами стола
	if ((_ball.center.x > tblX2 - 15) || (_ball.center.x < tblX1 + 15)) { dx = -dx; speed = speed - ds*5; }
	if ((_ball.center.y > tblY2 - 15) || (_ball.center.y < tblY1 + 15)) { dy = -dy; }
	if ( speed <= 0 ) { [self stop]; }
	
	//замедляем шарик
	speed = speed - ds;
	
	// перемещаем мячик в новую позицию в зависимости от направления и скорости движения
    _ball.center = CGPointMake(_ball.center.x + dx*speed,	_ball.center.y + dy*speed);
	
	// пишем в дебаг-вью
	//[_debugInfoBallX setText:[NSString stringWithFormat:@"%f", _ball.center.x]];
	//[_debugInfoBallY setText:[NSString stringWithFormat:@"%f", _ball.center.y]];
	//[_debugInfoBallDX setText:[NSString stringWithFormat:@"%f", dx]];
	//[_debugInfoBallDY setText:[NSString stringWithFormat:@"%f", dy]];
	}



- (void)start {
	if (timer == nil) {
		timer = [NSTimer scheduledTimerWithTimeInterval: 1.0/60.0 target:self selector:@selector(animate) userInfo:NULL repeats:YES];
		}
	_ball.hidden = NO; }

- (void)stop {
	if (timer != nil) {
		[timer invalidate]; timer = nil; }
	_ball.hidden = YES; }


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in touches) {
		// Пишем лог
		//CGPoint location = [touch locationInView:_mainGameView];
		//[_debugInfoTouchBeginX setText:[NSString stringWithFormat:@"%f", location.x]];
		//[_debugInfoTouchBeginY setText:[NSString stringWithFormat:@"%f", location.y]];

		// Узнаем текущее положение мяча
		ballCurrentLocation = _ball.center;
		}
	}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch *touch in touches) {
		// Пишем лог
		CGPoint location = [touch locationInView:_mainGameView];
		//[_debugInfoTouchEndX setText:[NSString stringWithFormat:@"%f", location.x]];
		//[_debugInfoTouchEndY setText:[NSString stringWithFormat:@"%f", location.y]];
		Xres = location.x - drawLineBegin.x;
		Yres = location.y - drawLineBegin.y;
		speedLength = hypot(Xres,Yres);
		//[_debugInfoTouchLength setText:[NSString stringWithFormat:@"%f", speedLength]];
		angleValue = acos(Xres/speedLength);
		angleValueInDegrees = angleValue * 180 / M_PI;
		//[_debugInfoTouchAngle setText:[NSString stringWithFormat:@"%f", angleValueInDegrees]];
		
		touchdx = Xres/speedLength;
		touchdy = Yres/speedLength;
		//[_debugInfoBallDX setText:[NSString stringWithFormat:@"%f", touchdx]];
		//[_debugInfoBallDY setText:[NSString stringWithFormat:@"%f", touchdy]];
		}
	}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  [self endTouches:touches];
  }

- (void)endTouches:(NSSet *)touches {
	for (UITouch *touch in touches) {
		touchdx = Xres/speedLength; touchdy = Yres/speedLength;
		//speed = 3;
		//[_debugInfoBallDX setText:[NSString stringWithFormat:@"%f", dx]]; [_debugInfoBallDY setText:[NSString stringWithFormat:@"%f", dy]];

		//NSValue *key = [NSValue valueWithNonretainedObject:t];
		//Line *line = [linesInProcess objectForKey:key];
		// Если двойной тап, 'line' примет значение nil,
		// не добавляйте ее в массив
		//if (line) {
		//[completeLines addObject:line];
		//[linesInProcess removeObjectForKey:key]; }
		}
	// Перерисовывание
	//[self setNeedsDisplay];
	}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
  [self endTouches:touches];
  }


@end
