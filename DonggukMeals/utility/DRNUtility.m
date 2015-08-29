//
//  DRNUtility.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNUtility.h"

@implementation DRNUtility

+ (CGRect)screenBounds
{
    return [UIScreen mainScreen].bounds;
}

+ (CGSize)screenSize
{
    return [self screenBounds].size;
}

+ (CGFloat)screenWidth
{
    return [self screenSize].width;
}

+ (CGFloat)screenHeight
{
    return [self screenSize].height;
}

+ (CGFloat)statusBarHeight
{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

+ (NSString *)versionString
{
    NSString * appVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return appVersionString;
}

@end
