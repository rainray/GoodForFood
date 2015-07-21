//
//  NSObject+Model.m
//  01－彩票
//
//  Created by apple on 15/7/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/runtime.h>

@implementation NSObject (Model)

+ (instancetype)objectWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict
{
    id item = [[self alloc] init];
    
    //遍历item中的属性
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    
    for (NSInteger i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        
        NSString *ivarName = @(ivar_getName(ivar));
        
        ivarName = [ivarName substringFromIndex:1];
        
        id value = dict[ivarName];
        
        if (value == nil) {
            
            if (mapDict) {
                NSString *keyName = mapDict[ivarName];
                value = dict[keyName];
            }
        }
        
        
        [item setValue:value forKeyPath:ivarName];
        
    }
    
    return item;
}

@end
