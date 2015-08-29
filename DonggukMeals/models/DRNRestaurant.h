//
//  DRNRestaurant.h
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRNRestaurant : NSObject

@property (strong, nonatomic) NSNumber *code;
@property (strong, nonatomic) NSString *name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)restaurantsWithRawArray:(NSArray *)array;

@end