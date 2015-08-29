//
//  DRNMealListCell.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 23..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNMealListCell.h"

// Utility
#import "UIFont+DRNExtension.h"
#import "UIColor+DRNExtension.h"

// Library
#import <Masonry/Masonry.h>

@implementation DRNMealListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // Initialize value label
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.font = [UIFont hannaWithSize:17.0];
        _valueLabel.textColor = [UIColor drn_blackColor];
        _valueLabel.numberOfLines = 0;
        [self.contentView addSubview:_valueLabel];
        
        // Initialize sepeartor view
        _seperatorView = [[UIView alloc] init];
        _seperatorView.backgroundColor = [UIColor drn_seperatorColor];
        [self.contentView addSubview:_seperatorView];
        
        [self makeAutoLayoutConstraints];
    }
    return self;
}

- (void)makeAutoLayoutConstraints
{
    [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@19.0f);
        make.right.equalTo(@(-19.0f));
        make.top.equalTo(@22.0f);
        make.bottom.equalTo(@(-22.0f));
    }];
    
    [_seperatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@19.0f);
        make.right.equalTo(@(-19.0f));
        make.height.equalTo(@.5f);
        make.bottom.equalTo(@0);
    }];
}

@end
