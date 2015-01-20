//
//  DetailViewController.h
//  Monobrand
//
//  Created by maksbu on 17.06.14.
//  Copyright (c) 2014 MAKSBURO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
