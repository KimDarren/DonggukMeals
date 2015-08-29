//
//  DRNRestaurantListNavigationController.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNRestaurantListNavigationController.h"

// Utility
#import "UIColor+DRNExtension.h"
#import "UIFont+DRNExtension.h"

@interface DRNRestaurantListNavigationController ()

@end

@implementation DRNRestaurantListNavigationController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Set the style of navigation bar
        self.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationBar.barTintColor = [UIColor drn_keyColor];
        
        // Hide the shadow of navigation bar
        [self findShadowImageViewUnder:self.navigationBar].alpha = 0.0f;
        
        // Set the font of title in navigation bar
        NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                              NSFontAttributeName: [UIFont hannaWithSize:20.0f]};
        self.navigationBar.titleTextAttributes = titleTextAttributes;
        self.navigationBar.translucent = NO;
    }
    return self;
}

// The method below find the shadow image view (navigation bar)
// I refer the code in: http://stackoverflow.com/a/19227158/4356845
- (UIImageView *)findShadowImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findShadowImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
