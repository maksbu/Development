//
//  InfoView.h
//  PoolHallJungle
//
//  Created by Mac on 06.05.14.
//  Copyright (c) 2014 maksburo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoLayerView : UIView
{
				NSMutableDictionary *linesInProcess;
				NSMutableArray *completeLines;
				
				UILabel *lineBeginPointLabel;
				UILabel *lineEndPointLabel;
}

- (void)makeLinesData;
- (void)endTouches:(NSSet *)touches;

@end
