//
//  UIView+Frame.m
//  01－彩票
//
//  Created by apple on 15/6/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint centerP = self.center;
    centerP.x = centerX;
    self.center = centerP;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint centerP = self.center;
    centerP.y = centerY;
    self.center = centerP;
}

- (void)setHeight:(CGFloat)height
{
    CGRect tempF = self.frame;
    tempF.size.height = height;
    self.bounds = tempF;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setWidth:(CGFloat)width
{
    CGRect tempF = self.frame;
    tempF.size.width = width;
    self.frame = tempF;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setX:(CGFloat)x
{
    CGRect tempF = self.frame;
    tempF.origin.x = x;
    self.frame = tempF;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect tempF = self.frame;
    tempF.origin.y = y;
    self.frame = tempF;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

@end
