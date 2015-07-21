//
//  ZLTabBar.m
//  GoodForFood
//
//  Created by apple on 15/7/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ZLTabBar.h"
#import "ZLTabBarButton.h"

@interface ZLTabBar()

@property (nonatomic, strong) ZLTabBarButton *selBtn;

@end

@implementation ZLTabBar

- (void)setItems:(NSArray *)items
{
    _items = items;
    
    for (UITabBarItem *item in items) {
        ZLTabBarButton *btn = [ZLTabBarButton buttonWithType:UIButtonTypeCustom];
        
        
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        btn.tag = self.subviews.count;
        
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        
        if (self.subviews.count == 1) {
            btn.selected = YES;
            self.selBtn = btn;
        }
    }
}

- (void)clickBtn:(ZLTabBarButton *)btn
{
    self.selBtn.selected = NO;
    btn.selected = YES;
    self.selBtn = btn;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:clickBtn:)]) {
        [self.delegate tabBar:self clickBtn:btn.tag];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.items.count;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    
    for (NSInteger i = 0; i < count; i++) {
        ZLTabBarButton *btn = self.subviews[i];
        
        w = self.width / count;
        x = w * i;
        h = self.height;
        
        btn.frame = CGRectMake(x, y, w, h);
    }
}

@end
