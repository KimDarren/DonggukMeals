//
//  DRNMenuEmptyFooterView.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 23..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNMenuEmptyFooterView.h"

// Utility
#import "UIFont+DRNExtension.h"

// Library
#import <Masonry/Masonry.h>

@implementation DRNMenuEmptyFooterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1.0f alpha:.3f];
        
        // Initialize message label
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.text = @"학식 데이터가 없습니다!ㅠㅠ";
        _messageLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3f];
        _messageLabel.font = [UIFont hannaWithSize:15.0f];
        [self addSubview:_messageLabel];
        
        [self makeAutoLayoutConstraints];
    }
    return self;
}

- (void)makeAutoLayoutConstraints
{
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

@end
