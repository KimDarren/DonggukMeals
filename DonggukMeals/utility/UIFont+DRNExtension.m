//
//  UIFont+DRNExtension.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "UIFont+DRNExtension.h"

@implementation UIFont (DRNExtension)

+ (UIFont *)juaWithSize:(CGFloat)size
{
    // The identity font of this application.
    // Jua Font: http://www.woowahan.com/?page_id=3985
    return [self fontWithName:@"BMJUAOTF" size:size];
}

+ (UIFont *)hannaWithSize:(CGFloat)size
{
    // The identity font of this application.
    // Jua Font: http://www.woowahan.com/?page_id=3985
    return [self fontWithName:@"BM-HANNAStd" size:size];
}

@end