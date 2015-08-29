//
//  DRNRestaurantListViewController.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNRestaurantListViewController.h"

// Model
#import "DRNRestaurant.h"

// View
#import "DRNRestaurantListCell.h"

// View Controller
#import "DRNSectionListViewController.h"
#import "DRNMoreViewController.h"

// Utility
#import "DRNNetworkManager.h"

// Library
#import <Masonry/Masonry.h>

static NSString * const DRNRestaurantListCellId = @"DRNRestaurantListCell";

@interface DRNRestaurantListViewController ()

@end

@implementation DRNRestaurantListViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Initialize table view
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 44.0f;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [_tableView registerClass:[DRNRestaurantListCell class]
           forCellReuseIdentifier:DRNRestaurantListCellId];
        
        [self.view addSubview:_tableView];
        [self makeAutoLayoutConstraints];
        self.title = @"학생식당 목록";
        
        UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"?" style:UIBarButtonItemStyleDone target:self action:@selector(presentMoreView:)];
        self.navigationItem.leftBarButtonItem = left;
    }
    return self;
}

- (void)makeAutoLayoutConstraints
{
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [DRNNetworkManager restaurantListsWithSuccess:^(id responseObject) {
        _restaurants = responseObject;
        [_tableView reloadData];
    } failure:^(NSError *error) {
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"학생식당 목록";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [DRNNetworkManager sendGA:@"Restaurant List"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.title = @"";
}

#pragma mark - Actions

- (void)presentMoreView:(UIBarButtonItem *)moreButton
{
    DRNMoreViewController *moreViewController = [[DRNMoreViewController alloc] init];
    
    [self presentViewController:moreViewController animated:YES completion:nil];
}

#pragma mark - Table view data sources and delegates

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DRNRestaurantListCell *cell = [tableView dequeueReusableCellWithIdentifier:DRNRestaurantListCellId
                                                                  forIndexPath:indexPath];
    DRNRestaurant *restaurant = [_restaurants objectAtIndex:indexPath.row];
    cell.nameLabel.text = restaurant.name;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _restaurants.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DRNRestaurant *restaurant = [_restaurants objectAtIndex:indexPath.row];
    DRNSectionListViewController *sectionListViewController = [[DRNSectionListViewController alloc] initWithRestaurant:restaurant];
    [self.navigationController pushViewController:sectionListViewController animated:YES];
}

@end
