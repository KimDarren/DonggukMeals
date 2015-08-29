//
//  DRNNetworkManager.h
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import <Foundation/Foundation.h>

#define URL     @"http://api.koreandarren.com/dongguk_meals"
#define URL_RESTAURANTS     URL "/restaurant_list.php"
#define URL_MENU_SECTIONS   URL "/menu_section_list.php"
#define URL_MEALS           URL "/meals_list.php"
#define URL_ANALYTICS       URL "/analytics.php"

typedef void (^DRNNetworkSuccessHandler) (id responseObject);
typedef void (^DRNNetworkFailureHandler) (NSError *error);

@class DRNRestaurant;
@class AFHTTPRequestOperationManager;

@interface DRNNetworkManager : NSObject

+ (AFHTTPRequestOperationManager *)requestManager;
+ (void)restaurantListsWithSuccess:(DRNNetworkSuccessHandler)success
                           failure:(DRNNetworkFailureHandler)failure;
+ (void)sectionListsWithRestaurant:(DRNRestaurant *)restaurant
                           success:(DRNNetworkSuccessHandler)success
                           failure:(DRNNetworkFailureHandler)failure;
+ (void)mealListsWithRestaurant:(DRNRestaurant *)restaurant
                   sectionIndex:(NSInteger)index
                        success:(DRNNetworkSuccessHandler)success
                        failure:(DRNNetworkFailureHandler)failure;

+ (void)sendGA:(NSString *)screenName;

@end
