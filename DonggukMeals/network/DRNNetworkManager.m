//
//  DRNNetworkManager.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNNetworkManager.h"

// Model
#import "DRNRestaurant.h"
#import "DRNMeal.h"

// Library
#import <AFNetworking/AFNetworking.h>
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"

@implementation DRNNetworkManager

+ (AFHTTPRequestOperationManager *)requestManager
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    return manager;
}

+ (void)restaurantListsWithSuccess:(DRNNetworkSuccessHandler)success failure:(DRNNetworkFailureHandler)failure
{
    AFHTTPRequestOperationManager *manager = [self requestManager];
    [manager GET:URL_RESTAURANTS parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *restaurants = [DRNRestaurant restaurantsWithRawArray:responseObject];
        success(restaurants);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

+ (void)sectionListsWithRestaurant:(DRNRestaurant *)restaurant
                           success:(DRNNetworkSuccessHandler)success
                           failure:(DRNNetworkFailureHandler)failure;
{
    NSDictionary *parameters = @{@"code": restaurant.code};
    
    AFHTTPRequestOperationManager *manager = [self requestManager];
    [manager GET:URL_MENU_SECTIONS parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *sections = responseObject;
        success(sections);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

+ (void)mealListsWithRestaurant:(DRNRestaurant *)restaurant
                   sectionIndex:(NSInteger)index
                        success:(DRNNetworkSuccessHandler)success
                        failure:(DRNNetworkFailureHandler)failure
{
    NSDictionary *parameters = @{@"code": restaurant.code,
                                 @"section": @(index)};
    AFHTTPRequestOperationManager *manager = [self requestManager];
    [manager GET:URL_MEALS parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *meals = [DRNMeal mealsWithRawArray:responseObject];
        success(meals);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

+ (void)sendGA:(NSString *)screenName
{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:screenName];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

@end
