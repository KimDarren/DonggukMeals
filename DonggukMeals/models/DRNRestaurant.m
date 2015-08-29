//
//  DRNRestaurant.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNRestaurant.h"

static NSString * const DRNRestaurantCodeKey = @"code";
static NSString * const DRNRestaurantNameKey = @"name";

@implementation DRNRestaurant

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _code = [dictionary objectForKey:DRNRestaurantCodeKey];
        _name = [dictionary objectForKey:DRNRestaurantNameKey];
    }
    return self;
}

+ (NSArray *)restaurantsWithRawArray:(NSArray *)array
{
    NSMutableArray *result = [NSMutableArray new];
    for (NSDictionary *dictionary in array) {
        DRNRestaurant *restaurant = [[DRNRestaurant alloc] initWithDictionary:dictionary];
        [result addObject:restaurant];
    }
    return result;
}

@end