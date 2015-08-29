//
//  DRNRestaurantListViewController.h
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRNRestaurantListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *restaurants;

- (instancetype)init;

@end
