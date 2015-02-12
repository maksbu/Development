//
//  QuizViewController.h
//  Quiz
//
//  Created by maksbu on 29.08.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController

{
    NSMutableArray *questions;
    NSMutableArray *answers;
}
- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;
@end
