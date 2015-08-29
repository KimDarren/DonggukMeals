//
//  DRNMoreViewController.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 4. 26..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "DRNMoreViewController.h"

// Utility
#import "DRNUtility.h"
#import "DRNNetworkManager.h"
#import "UIFont+DRNExtension.h"
#import "UIColor+DRNExtension.h"

// Library
#import <Masonry/Masonry.h>
#import <AFNetworking/UIKit+AFNetworking.h>

@interface DRNMoreViewController ()

@end

@implementation DRNMoreViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"동국밥";
        
        _topBorderView = [[UIView alloc] init];
        _topBorderView.backgroundColor = [UIColor lightGrayColor];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = self.title;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont hannaWithSize:20.0f];
        _titleLabel.textColor = [UIColor drn_blackColor];
        
        _closeButton = [[UIButton alloc] init];
        _closeButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [_closeButton setTitle:@"Close" forState:UIControlStateNormal];
        [_closeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
        
        
        _faceImageView = [[UIImageView alloc] init];
        _faceImageView.clipsToBounds = YES;
        _faceImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_faceImageView setImageWithURL:[NSURL URLWithString:@"http://graph.facebook.com/my.name.is.taejun/picture?width=500&height=500"]];
        
        _faceShadowView = [[UIView alloc] init];
        _faceShadowView.backgroundColor = [[UIColor drn_blackColor] colorWithAlphaComponent:.8f];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont boldSystemFontOfSize:22.0f];
        _nameLabel.text = @"KIM TAE JUN";
        
        _emailLabel = [[UILabel alloc] init];
        _emailLabel.text = @"korean.darren@gmail.com";
        _emailLabel.textColor = [UIColor colorWithWhite:1.0f alpha:.8f];
        _emailLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"moreCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _contents = @[[NSString stringWithFormat:@"version %@", [DRNUtility versionString]],
                      @"Open source license",
                      @"Website",
                      @"Developer Website",
                      @"Send email"];
        
        [self.view addSubview:_topBorderView];
        [self.view addSubview:_titleLabel];
        [self.view addSubview:_closeButton];
        [self.view addSubview:_faceImageView];
        [self.view addSubview:_faceShadowView];
        [self.view addSubview:_nameLabel];
        [self.view addSubview:_emailLabel];
        [self.view addSubview:_tableView];
        
        NSString* path = [[NSBundle mainBundle] pathForResource:@"LICENSE" ofType:@""];
        NSString *content = [NSString stringWithContentsOfFile:path
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
        
        
        _licenseTextView = [[UITextView alloc] init];
        _licenseTextView.backgroundColor = [UIColor clearColor];
        _licenseTextView.text = content;
        _licenseTextView.selectable = NO;
        _licenseTextView.editable = NO;
        _licenseTextView.textColor = [UIColor whiteColor];
        _licenseTextView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0f];
        
        _licenseCloseButton = [[UIButton alloc] init];
        _licenseCloseButton.backgroundColor = [UIColor colorWithWhite:1.0f alpha:.5f];
        _licenseCloseButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f];
        [_licenseCloseButton setTitle:@"CLOSE" forState:UIControlStateNormal];
        [_licenseCloseButton setTitleColor:[UIColor drn_blackColor] forState:UIControlStateNormal];
        [_licenseCloseButton addTarget:self action:@selector(closeLicenseView:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _blurredView = [[UIVisualEffectView alloc] initWithEffect:effect];
        [_blurredView addSubview:_licenseTextView];
        [_blurredView addSubview:_licenseCloseButton];
        _blurredView.hidden = YES;
        
        [self.view addSubview:_blurredView];
        
        [self makeAutoLayoutConstraints];
    }
    return self;
}

- (void)makeAutoLayoutConstraints
{
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@44.0f);
        make.left.and.right.equalTo(@0.0f);
        make.top.equalTo(@([DRNUtility statusBarHeight]));
    }];
    
    [_closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@19.0f);
        make.centerY.equalTo(_titleLabel);
    }];
    
    [_topBorderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1.0f);
        make.left.equalTo(@19.0f);
        make.right.equalTo(@(-19.0f));
        make.top.equalTo(_titleLabel.mas_bottom);
    }];
    
    [_faceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topBorderView.mas_bottom);
        make.left.and.right.equalTo(@0.0f);
        make.height.equalTo(_faceImageView.mas_width).multipliedBy(9.0f/16.0f);
    }];
    
    [_faceShadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_faceImageView);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_faceImageView);
    }];
    
    [_emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_nameLabel);
        make.top.equalTo(_nameLabel.mas_bottom);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(@.0f);
        make.top.equalTo(_faceImageView.mas_bottom);
    }];
    
    [_blurredView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(@.0f);
        make.top.equalTo(_faceImageView.mas_bottom);
    }];
    
    [_licenseTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.equalTo(@.0f);
        make.bottom.equalTo(_licenseCloseButton.mas_top);
    }];
    
    [_licenseCloseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@44.0f);
        make.left.right.and.bottom.equalTo(@.0f);
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [DRNNetworkManager sendGA:@"More"];
}

#pragma mark - Action

- (void)close:(UIBarButtonItem *)closeButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)closeLicenseView:(UIButton *)licenseButton
{
    [UIView animateWithDuration:.2f animations:^{
        _blurredView.hidden = YES;
    }];
}

#pragma mark - Table view delegate and data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _contents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moreCell" forIndexPath:indexPath];
    NSString *text = _contents[indexPath.row];
    cell.textLabel.text = text.uppercaseString;
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:12.0f];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
    }
    else if (indexPath.row == 1) {
        [UIView animateWithDuration:.2f animations:^{
            _blurredView.hidden = NO;
        }];
    }
    else if (indexPath.row == 2) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://dongguk.ml"]];
    }
    else if (indexPath.row == 3) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://koreandarren.com"]];
    }
    else if (indexPath.row == 4) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:korean.darren@gmail.com"]];
    }
}

@end