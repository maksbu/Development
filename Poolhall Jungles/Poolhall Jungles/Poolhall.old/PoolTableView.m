//
//  PoolTableView.m
//  Poolhall Jungles
//
//  Created by maksbu on 02.02.15.
//  Copyright (c) 2015 MAKSBU. All rights reserved.

//

#import "PoolTableView.h"

@implementation PoolTableView

- (void)drawRect:(CGRect)incomingRect
{
				//CGRect poolTableFrame = CGRectMake(100, 100, 500, 500);
				CGRect bounds = [self bounds];
				CGContextRef ctx = UIGraphicsGetCurrentContext();
				CGContextSetLineWidth(ctx, 5);
				CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
				//CGContextAddArc(ctx, 100, 100, 10, 0.0, M_PI * 2.0, YES);
				CGContextAddRect(ctx, bounds);
				CGContextStrokePath(ctx);
}

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
