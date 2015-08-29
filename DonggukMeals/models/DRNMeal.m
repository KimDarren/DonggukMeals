//
//  DRNMeal.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 23..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNMeal.h"

static NSString * const DRNMealKindKey = @"kind";
static NSString * const DRNMealNativeKey = @"native";
static NSString * const DRNMealValueKey = @"value";

@implementation DRNMeal

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _kind = [dictionary objectForKey:DRNMealKindKey];
        _native = [dictionary objectForKey:DRNMealNativeKey];
        _value = [dictionary objectForKey:DRNMealValueKey];
        [self convertValueString];
    }
    return self;
}

- (void)convertValueString
{
    NSArray *values = [_value componentsSeparatedByString:@"|"];
    NSMutableArray *result = [NSMutableArray new];
    for (NSString *string in values) {
        NSArray* words = [string componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSString* nospacestring = [words componentsJoinedByString:@""];
        if ([nospacestring isEqualToString:@"-"] || [nospacestring isEqualToString:@""])
            continue;
        else if ([nospacestring containsString:@"￦"]) {
            _price = [nospacestring stringByReplacingOccurrencesOfString:@"￦" withString:@""];
            continue;
        }
        [result addObject:nospacestring];
    }
    _values = result;
    
    // Split the raw data.
    // TO DO : Make algorithm better.
    if (_values.count == 1) {
        NSString *value = [_values objectAtIndex:0];
        // @@ is just characters to sort.
        value = [value stringByReplacingOccurrencesOfString:@"000" withString:@"@@00"];
        
        NSMutableArray *result = [NSMutableArray new];
        _values = [value componentsSeparatedByString:@"00"];
        for (NSString *string in _values) {
            NSString *value = [string stringByReplacingOccurrencesOfString:@"0" withString:@""];
            if ([value length] > 1) {
                value = [NSString stringWithFormat:@"%@00", value];
                value = [value stringByReplacingOccurrencesOfString:@"@@" withString:@"0"];
                [result addObject:value];
            }
        }
        // Remove unnecessary/empty object.
        [result removeObject:@""];
        [result removeObject:@"00"];
        _values = result;
    }
}

+ (NSArray *)mealsWithRawArray:(NSArray *)array
{
    NSMutableArray *result = [NSMutableArray new];
    for (NSDictionary *dictionary in array) {
        DRNMeal *meal = [[DRNMeal alloc] initWithDictionary:dictionary];
        [result addObject:meal];
    }
    return result;
}

@end
