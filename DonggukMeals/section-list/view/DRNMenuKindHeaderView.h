//
//  DRNMenuKindHeaderView.h
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 23..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DRNMeal;

@interface DRNMenuKindHeaderView : UIView

@property (weak, nonatomic) DRNMeal *meal;
@property (strong, nonatomic) UILabel *kindLabel;
@property (strong, nonatomic) UIView *detailView;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *nativeLabel;
@property (strong, nonatomic) UIVisualEffectView *effectView;

- (instancetype)initWithMeal:(DRNMeal *)meal;

@end
