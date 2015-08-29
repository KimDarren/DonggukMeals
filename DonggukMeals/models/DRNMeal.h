//
//  DRNMeal.h
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 23..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRNMeal : NSObject

@property (strong, nonatomic) NSString *kind;
@property (strong, nonatomic) NSString *native;
@property (strong, nonatomic) NSString *value;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSArray *values;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)mealsWithRawArray:(NSArray *)array;

@end
