//
//  UINavigationItem+MRCBackBarButtonItem.m
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 15/6/17.
//  Copyright (c) 2015年 leichunfeng. All rights reserved.
//

#import "UINavigationItem+MRCBackBarButtonItem.h"
#import <objc/runtime.h>

@implementation UINavigationItem (MRCBackBarButtonItem)

/*
 Method class_getInstanceMethod(Class aClass, SEL aSelector)                返回aClass的名为aSelector的方法
 BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)      给cls添加一个新的方法,若干cls存在这个方法则返回失败
 IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)   替换cls的name方法的指针
 void method_exchangeImplementations(Method m1_gen, Method m2_gen)          交换2个方法的实现指针,把父类替的方法替换掉
 
 IMP method_getImplementation(Method method)    返回method的实现指针
 method_getTypeEncoding(Method m)   返回方法m的参数和返回值的描述的字串
 */

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(backBarButtonItem);
        SEL swizzledSelector = @selector(mrc_backBarButtonItem);
        
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        class_replaceMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    });
}

#pragma mark - Method Swizzling

- (UIBarButtonItem *)mrc_backBarButtonItem {
    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
}

@end
