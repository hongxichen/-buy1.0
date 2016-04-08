//
//  ClassLeftCollectionView.h
//  买买买
//
//  Created by 洪曦尘 on 16/2/9.
//  Copyright © 2016年 洪曦尘. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassLeftCollectionView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)NSArray *models;

@end
