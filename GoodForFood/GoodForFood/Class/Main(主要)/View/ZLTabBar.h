//
//  ZLTabBar.h
//  GoodForFood
//
//  Created by apple on 15/7/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZLTabBar;

@protocol ZLTabBarDelegate <NSObject>

- (void)tabBar:(ZLTabBar *)tabBar clickBtn:(NSInteger)index;

@end

@interface ZLTabBar : UIView

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, weak) id<ZLTabBarDelegate> delegate;

@end
