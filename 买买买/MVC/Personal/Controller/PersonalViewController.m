//
//  PersonalViewController.m
//  买买买
//
//  Created by 洪曦尘 on 16/1/31.
//  Copyright © 2016年 洪曦尘. All rights reserved.
//

#import "PersonalViewController.h"

@interface PersonalViewController ()

{
    UIButton *_locationButton;
    CLLocationManager *_locationManager;
    
    UIButton *_scanButton;
    
    UIButton *_cacheButton;
    UILabel *_cacheLabel;
}

@end

@implementation PersonalViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _scanButton.hidden = NO;
    
    [self countCacheSize];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    _scanButton.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    [self _createLocationButton];
    [self _createScanButton];
    [self _createCacheButton];
}

- (void)_createLocationButton
{
    _locationButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    [_locationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _locationButton.backgroundColor = [UIColor whiteColor];
    [_locationButton setTitle:@"我在哪里" forState:UIControlStateNormal];
    [_locationButton addTarget:self action:@selector(locationButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_locationButton];
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
}

- (void)locationButtonAction
{
    [_locationManager stopUpdatingLocation];
    
    [_locationButton setTitle:@"定位中..." forState:UIControlStateNormal];
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
        [_locationManager requestWhenInUseAuthorization];
    }
    
    [_locationManager startUpdatingLocation];
    
//    CLLocationDistance dis = 10.0;
//    _locationManager.distanceFilter = 10000.0;
}

#pragma mark ---CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    for (CLLocation *location in locations) {
//        float latitude = location.coordinate.latitude;
//        float longitude = location.coordinate.longitude;
        
        [_locationManager stopUpdatingLocation];
        
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
            for (CLPlacemark *placemark in placemarks) {
                [_locationButton setTitle:[NSString stringWithFormat:@"%@ %@",placemark.locality,placemark.name] forState:UIControlStateNormal];
            }
            
        }];
    }
}

- (void)_createScanButton
{
    _scanButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 35, 12, 20, 20)];
    [_scanButton setBackgroundImage:[UIImage imageNamed:@"Explore_ScanButton@2x"] forState:UIControlStateNormal];
    [_scanButton addTarget:self action:@selector(scanButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationController.navigationBar addSubview:_scanButton];
}

- (void)scanButtonAction
{
    ScanViewController *scanVC = [[ScanViewController alloc] init];
    
    [self.navigationController pushViewController:scanVC animated:YES];
}

- (void)_createCacheButton
{
    _cacheButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 55, kScreenWidth, 50)];
    _cacheButton.backgroundColor = [UIColor whiteColor];
    [_cacheButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [_cacheButton setTitle:@"清除缓存" forState:UIControlStateNormal];
    [_cacheButton addTarget:self action:@selector(cacheButtonAction) forControlEvents:UIControlEventTouchUpInside];
    _cacheButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.view addSubview:_cacheButton];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 70, 30)];
    label.text = @"清除缓存";
    
    [_cacheButton addSubview:label];
    
    _cacheLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 60, 10, 50, 30)];
    
    [_cacheButton addSubview:_cacheLabel];
    
    [self countCacheSize];
    
}

- (void)cacheButtonAction
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"清空缓存" message:@"确定要清空缓存?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [[SDImageCache sharedImageCache] clearDisk];
        [self countCacheSize];
    }
}

- (void)countCacheSize
{
    NSInteger fileSize = [[SDImageCache sharedImageCache] getSize];
    _cacheLabel.text = [NSString stringWithFormat:@"%.1f M",fileSize / 1024 /1024.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
