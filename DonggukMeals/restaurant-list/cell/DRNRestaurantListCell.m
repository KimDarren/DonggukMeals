//
//  DRNRestaurantListCell.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNRestaurantListCell.h"

// Utility
#import "UIColor+DRNExtension.h"
#import "UIFont+DRNExtension.h"

// Library
#import <Masonry/Masonry.h>

@implementation DRNRestaurantListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // Initialize name label
        // Set the style of the name label
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont hannaWithSize:18.0f];
        _nameLabel.textColor = [UIColor drn_blackColor];
        _nameLabel.numberOfLines = 0;
        [self.contentView addSubview:_nameLabel];
        
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
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@19.0f);
        make.right.equalTo(@(-19.0f));
        make.top.equalTo(@20.0f);
        make.bottom.equalTo(@(-20.0f));
    }];
    
    [_seperatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@19.0f);
        make.right.equalTo(@(-19.0f));
        make.height.equalTo(@.5f);
        make.bottom.equalTo(@0);
    }];
}

@end
