//
//  ScanViewController.h
//  买买买
//
//  Created by 洪曦尘 on 16/2/23.
//  Copyright © 2016年 洪曦尘. All rights reserved.
//

#import "SecondViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface ScanViewController : SecondViewController <AVCaptureMetadataOutputObjectsDelegate>

@property (strong, nonatomic) UIView *boxView;
@property (nonatomic) BOOL isReading;
@property (strong, nonatomic) CALayer *scanLayer;

@property (nonatomic, strong) AVCaptureSession *captureSession;
//展示layer
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;

-(void)stopReading;

@end
