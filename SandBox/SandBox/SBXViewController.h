//
//  SBXViewController.h
//  SandBox
//
//  Created by Mac on 08.08.13.
//  Copyright (c) 2013 maksburo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBXViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *tempImage;

- (void)touchesBegan;

- (IBAction)pencilPressed:(id)sender;
- (IBAction)eraserPrecced:(id)sender;



@end


float red;
float green;
float blue;
float brush;
float opacity;