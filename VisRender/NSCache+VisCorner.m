//
//  NSCache+VisCorner.m
//  VisCorner
//
//  Created by WzxJiang on 17/1/4.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

#import "NSCache+VisCorner.h"

@implementation NSCache (VisCorner)

+ (instancetype)vis_cache {
    static NSCache * vis_cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vis_cache = [NSCache new];
    });
    return vis_cache;
}

@end
