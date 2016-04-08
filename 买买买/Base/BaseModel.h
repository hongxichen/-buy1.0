//
//  BaseModel.h
//  WXMovie
//
//  Created by wei.chen on 13-9-3.
//  Copyright (c) 2013年 www.iphonetrain.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (id)initContentWithDic:(NSDictionary *)jsonDic;
- (void)setAttributes:(NSDictionary *)jsonDic;
- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic;

@end
