//
//  DRNTabBarController.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 29..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNTabBarController.h"

// Utility
#import "UIColor+DRNExtension.h"
#import "UIFont+DRNExtension.h"

// Library
#import <Masonry/Masonry.h>

@interface DRNTabBarController ()

@end

@implementation DRNTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBar.translucent = NO;
        self.tabBar.barTintColor = [UIColor drn_blackColor];
        self.tabBar.tintColor = [UIColor whiteColor];
        
        _backgroundBar = [[UIView alloc] init];
        _backgroundBar.backgroundColor = [UIColor drn_blackColor];
        _backgroundBar.userInteractionEnabled = NO;
        [self.tabBar addSubview:_backgroundBar];
        
        _schoolLabel = [[UILabel alloc] init];
        _schoolLabel.textColor = [UIColor whiteColor];
        _schoolLabel.textAlignment = NSTextAlignmentCenter;
        _schoolLabel.font = [UIFont hannaWithSize:20.0f];
        _schoolLabel.text = @"학식";
        
        _dinningLabel = [[UILabel alloc] init];
        _dinningLabel.textColor = [UIColor lightGrayColor];
        _dinningLabel.textAlignment = NSTextAlignmentCenter;
        _dinningLabel.font = [UIFont hannaWithSize:20.0f];
        _dinningLabel.text = @"외식";
        
        [_backgroundBar addSubview:_schoolLabel];
        [_backgroundBar addSubview:_dinningLabel];
    }
    return self;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tabBar.frame = CGRectMake(0.0f,
                                   self.view.frame.size.height - 40.0f,
                                   self.view.frame.size.width,
                                   40.0f);
    _backgroundBar.frame = self.tabBar.bounds;
    _schoolLabel.frame = CGRectMake(0.0f,
                                    0.0f,
                                    _backgroundBar.frame.size.width/2.0f,
                                    _backgroundBar.frame.size.height);
    _dinningLabel.frame = CGRectMake(_backgroundBar.frame.size.width/2.0f,
                                     0.0f,
                                     _backgroundBar.frame.size.width/2.0f,
                                     _backgroundBar.frame.size.height);
}

@end
