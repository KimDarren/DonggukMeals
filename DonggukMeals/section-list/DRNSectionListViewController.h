//
//  DRNSectionListViewController.h
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DRNRestaurant;
@class DRNMeal;

@interface DRNSectionListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) DRNRestaurant *restaurant;
@property (strong, nonatomic) NSArray *sections;

@property (strong, nonatomic) NSMutableDictionary *meals;
@property (strong, nonatomic) NSArray *currentMeals;

@property (strong, nonatomic) UIView *sectionBottomView;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UITableView *tableView;

@property (assign, nonatomic) NSInteger selectedItem;

- (instancetype)initWithRestaurant:(DRNRestaurant *)restaurant;

@end
