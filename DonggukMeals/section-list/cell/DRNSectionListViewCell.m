//
//  DRNSectionListViewCell.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNSectionListViewCell.h"

// Library
#import <Masonry/Masonry.h>

// Utility
#import "UIFont+DRNExtension.h"
#import "UIColor+DRNExtension.h"

@implementation DRNSectionListViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Set the background color to show the bottom-line view below the collection view
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        // Initalize name label
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont hannaWithSize:17.0f];
        _nameLabel.textColor = [UIColor darkGrayColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        
        // Initalize bottom line
        // It will be show if this cell was selected.
        _bottomLine = [[UIView alloc] initWithFrame:CGRectZero];
        _bottomLine.backgroundColor = [UIColor drn_keyColor];
        
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_bottomLine];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Calculate the frame of views
    CGFloat bottomLineHeight = 3.0f;
    _nameLabel.frame = self.contentView.bounds;
    _bottomLine.frame = CGRectMake(0,
                                   self.contentView.bounds.size.height - bottomLineHeight,
                                   self.contentView.bounds.size.width,
                                   bottomLineHeight);
}

- (void)setName:(NSString *)name
{
    // Set the text of name label as name
    _name = name;
    _nameLabel.text = _name;
}

- (void)setSelectedItem:(BOOL)selectedItem
{
    // Show the bottom line view if this cell was selected
    _selectedItem = selectedItem;
    _bottomLine.alpha = _selectedItem;
    if (_selectedItem) {
        _nameLabel.textColor = [UIColor drn_blackColor];
    } else {
        _nameLabel.textColor = [UIColor drn_seperatorColor];
    }
}

@end
