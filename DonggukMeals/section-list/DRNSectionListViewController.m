//
//  DRNSectionListViewController.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNSectionListViewController.h"

// Model
#import "DRNRestaurant.h"
#import "DRNMeal.h"

// View
#import "DRNSectionListViewCell.h"
#import "DRNMealListCell.h"
#import "DRNMenuKindHeaderView.h"
#import "DRNMenuEmptyFooterView.h"

// Utility
#import "DRNUtility.h"
#import "DRNNetworkManager.h"
#import "UIFont+DRNExtension.h"

// Library
#import <Masonry/Masonry.h>

static NSString * const DRNSectionCellID = @"DRNSectionCellID";
static NSString * const DRNMealCellID = @"DRNMealCellID";

@implementation DRNSectionListViewController

- (instancetype)initWithRestaurant:(DRNRestaurant *)restaurant
{
    self = [super init];
    if (self) {
        _restaurant = restaurant;
        self.title = _restaurant.name;
        self.view.backgroundColor = [UIColor whiteColor];
        
        // Define the default value
        _selectedItem = 0;
        _meals = [NSMutableDictionary new];
        
        // Initialize collection view: contain the section informations
            // Initialize flow layout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = 0.0f;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                             collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[DRNSectionListViewCell class] forCellWithReuseIdentifier:DRNSectionCellID];
        
        // Initialize the section bottom view
        _sectionBottomView = [[UIView alloc] init];
        _sectionBottomView.backgroundColor = [UIColor lightGrayColor];
        
        // Initialize table view: contain the menu informations
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView registerClass:[DRNMealListCell class] forCellReuseIdentifier:DRNMealCellID];
        _tableView.estimatedRowHeight = 50.0f;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self.view addSubview:_sectionBottomView];
        [self.view addSubview:_collectionView];
        [self.view addSubview:_tableView];
        
        [self makeAutoLayoutConstraints];
    }
    return self;
}

- (void)viewDidLoad
{
    // Request to server (by restaurant information) and get the section list.
    [DRNNetworkManager sectionListsWithRestaurant:_restaurant success:^(id responseObject) {
        _sections = responseObject;
        [_collectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
    [self requestMealAtIndex:_selectedItem];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [DRNNetworkManager sendGA:[NSString stringWithFormat:@"%@\t%ld", _restaurant.name, _selectedItem]];
}

- (void)requestMealAtIndex:(NSInteger)index
{
    // Request to server (by restaurant and section index information) and get the meal (menu) lest.
    [DRNNetworkManager mealListsWithRestaurant:_restaurant sectionIndex:index success:^(id responseObject) {
        _currentMeals = responseObject;
        [_tableView reloadData];
    } failure:^(NSError *error) {
        [DRNNetworkManager sendGA:[NSString stringWithFormat:@"%@\t%ld", _restaurant.name, _selectedItem]];
    }];
}

- (void)makeAutoLayoutConstraints
{
    [_sectionBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(@0.0f);
        make.bottom.equalTo(_collectionView.mas_bottom);
        make.height.equalTo(@0.5f);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(@0.0f);
        make.top.equalTo(@0.0f);
        make.height.equalTo(@44.0f);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_collectionView.mas_bottom);
        make.left.right.and.bottom.equalTo(@0.0f);
    }];
}

#pragma mark - Table view data sources and delegates

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DRNMealListCell *cell = [tableView dequeueReusableCellWithIdentifier:DRNMealCellID forIndexPath:indexPath];
    DRNMeal *meal = _currentMeals[indexPath.section];
    cell.valueLabel.text = meal.values[indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _currentMeals.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DRNMeal *meal = _currentMeals[section];
    return meal.values.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 38.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    DRNMeal *meal = _currentMeals[section];
    if (meal.values.count > 0) {
        return 0.0f;
    }
    return 150.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    DRNMeal *meal = _currentMeals[section];
    DRNMenuKindHeaderView *header = [[DRNMenuKindHeaderView alloc] initWithMeal:meal];
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    DRNMenuEmptyFooterView *footer = [[DRNMenuEmptyFooterView alloc] init];
    return footer;
}

#pragma mark - Collection view data sources and delegates

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DRNSectionListViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DRNSectionCellID forIndexPath:indexPath];
    
    cell.name = _sections[indexPath.item];
    cell.selectedItem = (_selectedItem == indexPath.item);
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _sections.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Make the label below to just calculate the size of cell.
    UILabel *calculateLabel = [[UILabel alloc] init];
    calculateLabel = [[UILabel alloc] init];
    calculateLabel.font = [UIFont juaWithSize:17.0f];
    calculateLabel.text = _sections[indexPath.item];
    
    CGSize calculatedSize = [calculateLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, 100.0f)];
    calculatedSize.height = _collectionView.bounds.size.height;
    // Add 40px to add a left-right-space to cell
    calculatedSize.width += 40.0f;
    // Compare the width with label's width and collection view's width.
    // And use the bigger one.
    calculatedSize.width = MAX(calculatedSize.width, _collectionView.bounds.size.width/_sections.count);
    return calculatedSize;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedItem = indexPath.item;
    // Request to server to get the meal list by selected section.
    [self requestMealAtIndex:_selectedItem];
    // Scroll to selected section
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [collectionView reloadData];
}

@end
