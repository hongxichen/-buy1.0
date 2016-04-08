//
//  UIView+ViewController.m
//  买买买
//
//  Created by 洪曦尘 on 16/1/31.
//  Copyright © 2016 george. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController
{
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
        }
        
        next = next.nextResponder;
    }
    
    return nil;
}

@end
