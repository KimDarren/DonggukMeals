//
//  DRNMenuKindHeaderView.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 23..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNMenuKindHeaderView.h"

// Model
#import "DRNMeal.h"

// Utility
#import "DRNUtility.h"
#import "UIFont+DRNExtension.h"
#import "UIColor+DRNExtension.h"

// Library
#import <Masonry/Masonry.h>

@implementation DRNMenuKindHeaderView

- (instancetype)initWithMeal:(DRNMeal *)meal
{
    self = [super init];
    if (self) {
        _meal = meal;
        
        // Initialize visual(blur) effect view :use for background view
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        _effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        
        // Initialize kind label (Title)
        _kindLabel = [[UILabel alloc] init];
        _kindLabel.text = _meal.kind;
        _kindLabel.textColor = [UIColor darkGrayColor];
        _kindLabel.font = [UIFont hannaWithSize:18.0f];
        
        // Initialize detail view (containing price & native information)
        _detailView = [[UIView alloc] init];
            // Initialize price label
        _priceLabel = [[UILabel alloc] init];
                // Set the price if value exists
        if ([_meal.price length] > 1) {
            _priceLabel.text = [NSString stringWithFormat:@"가격 : %@원", _meal.price];
        }
        _priceLabel.textAlignment = NSTextAlignmentRight;
        _priceLabel.textColor = [UIColor lightGrayColor];
        _priceLabel.font = [UIFont juaWithSize:11.0f];
        
            // Initialize native label
        _nativeLabel = [[UILabel alloc] init];
                // Set the native if value exists
        if ([_meal.native length] > 1) {
            _nativeLabel.text = [NSString stringWithFormat:@"원산지 : %@", _meal.native];
        }
        _nativeLabel.textAlignment = NSTextAlignmentRight;
        _nativeLabel.textColor = [UIColor lightGrayColor];
        _nativeLabel.font = [UIFont juaWithSize:11.0f];
        
        [_detailView addSubview:_priceLabel];
        [_detailView addSubview:_nativeLabel];
        
        [self addSubview:_effectView];
        [self addSubview:_kindLabel];
        [self addSubview:_detailView];
        
        [self makeAutoLayoutConstraints];
    }
    return self;
}

- (void)makeAutoLayoutConstraints
{
    [_effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [_kindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@19.0f);
        make.centerY.equalTo(self);
    }];
    
    [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-19.0f));
        make.centerY.equalTo(self);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nativeLabel.mas_bottom);
        make.bottom.equalTo(_detailView);
        make.left.and.right.equalTo(_detailView);
    }];
    
    [_nativeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(_detailView);
        make.top.equalTo(_detailView);
    }];
}

@end
