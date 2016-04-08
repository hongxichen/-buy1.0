//
//  GoodsDetailViewController.h
//  买买买
//
//  Created by 洪曦尘 on 16/2/4.
//  Copyright © 2016年 洪曦尘. All rights reserved.
//

#import "SecondViewController.h"

@interface GoodsDetailViewController : SecondViewController <UIScrollViewDelegate,UIWebViewDelegate>


@property(nonatomic,copy)NSString *goodID;
@property(nonatomic,strong)HomeModel *homeModel;

@end
