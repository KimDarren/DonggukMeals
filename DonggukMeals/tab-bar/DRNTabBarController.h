//
//  DRNTabBarController.h
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 29..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRNTabBarController : UITabBarController

@property (strong, nonatomic) UIView *backgroundBar;
@property (strong, nonatomic) UILabel *schoolLabel;
@property (strong, nonatomic) UILabel *dinningLabel;

- (instancetype)init;

@end