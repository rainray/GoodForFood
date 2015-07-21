//
//  ZLMainController.m
//  GoodForFood
//
//  Created by apple on 15/7/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ZLMainController.h"
#import "ZLMainPageViewController.h"
#import "ZLNavigationController.h"
#import "ZLMyDetailController.h"
#import "ZLMessageViewController.h"
#import "ZLDiscoveryViewController.h"
#import "ZLFoodViewController.h"

#import "ZLTabBar.h"

@interface ZLMainController () <ZLTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ZLMainController

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAllChildViewController];
    
    [self setupTabBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[ZLTabBar class]]) {
            [childView removeFromSuperview];
        }
    }
}

- (void)setupTabBar
{
    ZLTabBar *tabBar = [[ZLTabBar alloc] initWithFrame:self.tabBar.bounds];
    
    tabBar.items = self.items;
    tabBar.delegate = self;
    
    [self.tabBar addSubview:tabBar];
}

#pragma mark - <ZLTabBarDelegate>
- (void)tabBar:(ZLTabBar *)tabBar clickBtn:(NSInteger)index
{
    self.selectedIndex = index;
}

- (void)setupAllChildViewController
{
    ZLMainPageViewController *mainPage = [[ZLMainPageViewController alloc] init];
    [self setupOneChildController:mainPage image:[UIImage imageNamed:@"首页 灰"] selImage:[UIImage imageNamed:@"首页"] title:@"善食策"];
    
    ZLFoodViewController *food = [[ZLFoodViewController alloc] init];
    [self setupOneChildController:food image:[UIImage imageNamed:@"料理 灰"] selImage:[UIImage imageNamed:@"料理"] title:@"料理"];
    
    ZLMessageViewController *message = [[ZLMessageViewController alloc] init];
    [self setupOneChildController:message image:[UIImage imageNamed:@"消息 灰"] selImage:[UIImage imageNamed:@"消息"] title:@"消息"];
    
    ZLDiscoveryViewController *discovery = [[ZLDiscoveryViewController alloc] init];
    [self setupOneChildController:discovery image:[UIImage imageNamed:@"发现 灰"] selImage:[UIImage imageNamed:@"发现"] title:@"发现"];
    
    ZLMyDetailController *me = [[ZLMyDetailController alloc] init];
    [self setupOneChildController:me image:[UIImage imageNamed:@"我的 灰"] selImage:[UIImage imageNamed:@"我的"] title:@"我的"];
    
}

- (void)setupOneChildController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title
{
    vc.navigationItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    
    [self.items addObject:vc.tabBarItem];
    vc.view.backgroundColor = [self randomColor];
    
    UINavigationController *navi = [[ZLNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:navi];
}

- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
