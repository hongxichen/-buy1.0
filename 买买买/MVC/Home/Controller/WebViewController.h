//
//  WebViewController.h
//  买买买
//
//  Created by 洪曦尘 on 16/2/20.
//  Copyright © 2016年 洪曦尘. All rights reserved.
//

#import "SecondViewController.h"

@interface WebViewController : SecondViewController <UIWebViewDelegate>

@property (nonatomic,copy) NSString *url;

@end
