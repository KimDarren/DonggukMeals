//
//  DRNSectionListViewCell.h
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRNSectionListViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) UIView *bottomLine;
@property (assign, nonatomic, getter=isSelectedItem) BOOL selectedItem;

- (instancetype)initWithFrame:(CGRect)frame;

@end
