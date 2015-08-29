//
//  DRNMoreViewController.h
//  DonggukMeals
//
//  Created by 1001246 on 2015. 4. 26..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRNMoreViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *closeButton;
@property (strong, nonatomic) UIView *topBorderView;
@property (strong, nonatomic) UIImageView *faceImageView;
@property (strong, nonatomic) UIView *faceShadowView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *emailLabel;

@property (strong, nonatomic) NSArray *contents;
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UITextView *licenseTextView;
@property (strong, nonatomic) UIVisualEffectView *blurredView;
@property (strong, nonatomic) UIButton *licenseCloseButton;

- (instancetype)init;

@end