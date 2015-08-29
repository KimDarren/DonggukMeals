//
//  DRNMealListCell.h
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 23..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRNMealListCell : UITableViewCell

@property (strong, nonatomic) UILabel *valueLabel;
@property (strong, nonatomic) UIView *seperatorView;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
