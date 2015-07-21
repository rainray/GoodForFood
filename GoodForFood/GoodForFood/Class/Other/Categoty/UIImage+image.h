//
//  UIImage+image.h
//  01－彩票
//
//  Created by apple on 15/6/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

+ (instancetype)imageNamedWithOriginalImage:(NSString *)imageName;

+ (instancetype)imageWithStretchableImage:(NSString *)imageName;
@end
