//
//  NSObject+Model.h
//  01－彩票
//
//  Created by apple on 15/7/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (Model)

+ (instancetype)objectWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict;

@end
