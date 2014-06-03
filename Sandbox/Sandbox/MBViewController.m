//
//  MBViewController.m
//  Sandbox
//
//  Created by Mac on 21.12.13.
//  Copyright (c) 2013 maksbu. All rights reserved.
//

#import "MBViewController.h"

@interface MBViewController ()

@end

@implementation MBViewController

@synthesize bomb;
@synthesize ball;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self reset];
    //[self start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// вывод сообщений
- (void)updateLabelsFromTouches:(NSSet *)touches {
    NSUInteger numTaps = [[touches anyObject] tapCount];
    NSString *tapMessage = [[NSString alloc]
                            initWithFormat:@"%d taps detected", numTaps];
    self.tapsLabel.text = tapMessage;
    
    NSUInteger numTouches = [touches count];
    NSString *touchMsg = [[NSString alloc] initWithFormat:@"%d touches detected", numTouches];
    self.touchesLabel.text = touchMsg;
    
    
}

// Обработка нажатий
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.messageLabel.text = @"Touches Began";
    [self updateLabelsFromTouches:touches];
    
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
    CGPoint touchLocation = [touch locationInView:self.view];
    
    bomb.center = touchLocation;
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    self.messageLabel.text = @"Touches Canseled";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.messageLabel.text = @"Touches Ended";
    [self updateLabelsFromTouches:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    self.messageLabel.text = @"Drag Detcted";
    [self updateLabelsFromTouches:touches];
    
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
    CGPoint touchLocation = [touch locationInView:self.view];
    
    if (touch.view == bomb) {
        bomb.center = touchLocation;
    }
}

// Летающий мячик
- (void)reset
{
    // задаем направление мячика, чтобы он летел либо влево, либо вправо
    if ((arc4random() % 2) == 0) dx = -1; else dx = 1;
    // Задаем для dy обратное значение, если ее предыдущее значение
    // было ненулевым. В таком случае мячик полетит к игроку,
    // только что набравшему очко. В противном случае
    // пускаем мячик в случайном направлении.
    if (dy != 0) dy = -dy;
    else if ((arc4random() % 2) == 0) dy = -1; else dy = 1;
    // перемещаем точку в случайное положение в области центра
    ball.center = CGPointMake(15 + arc4random() % (320-30), 240);
    // сбрасываем скорость
    speed = 2; }

- (void)animate
{
    // перемещаем мячик в новую позицию в зависимости от направления
    // и скорости движения
    ball.center = CGPointMake(ball.center.x + dx*speed,
                                  ball.center.y + dy*speed);
}
//Добавляем NSTimer к интерфейсу PaddlesViewController:
NSTimer *timer;

- (void)start
{
    if (timer == nil)
    {
        // создаем анимационный таймер
        timer = [[NSTimer
                  scheduledTimerWithTimeInterval: 1.0/60.0
                  target: self
                  selector: @selector(animate)
                  userInfo: NULL
                  repeats: YES] init]; //was retain
    }
    // отображаем мячик
    ball.hidden = NO;
}
- (void)stop
{
    if (timer != nil)
    {
        [timer invalidate];
        timer = nil;
    }
    // скрываем мячик
    ball.hidden = YES;
}


@end
