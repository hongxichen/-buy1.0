//
//  BaseTabBarItem.h
//  买买买
//
//  Created by 洪曦尘 on 16/1/31.
//  Copyright © 2016年 洪曦尘. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarItem : UIControl

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)name title:(NSString *)title;

@property (nonatomic,assign) BOOL isSelect;

@end
