#import "AmapGaoDe.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface AmapGaoDe () <AMapLocationManagerDelegate>

@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;

@end

@implementation AmapGaoDe

- (void)startActive
{
    //初始化AMapLocationManager对象，设置代理
    
    [AMapServices sharedServices].apiKey=@"5731c751865c618db2afb227d4e2eec5";
    
    self.locationManager = [[AMapLocationManager alloc] init];
    
    [self.locationManager setDelegate:self];
    
    // 带逆地理信息的一次定位（返回坐标和地址信息  高精度）
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    //   定位超时时间，最低2s，此处设置为10s
    [self.locationManager setLocationTimeout:10];
    //   逆地理请求超时时间，最低2s，此处设置为10s
    [self.locationManager setReGeocodeTimeout:10];
}

- (void)locateAction
{
    //带逆地理的单次定位
    //带逆地理（返回坐标和地址信息）。将下面代码中的 YES 改成 NO ，则不会返回地址信息。
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
        if (error)
        {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            
            NSString *err=@"1|1";
            UnitySendMessage("Main Camera", "IOSGPSUpdate",[err UTF8String]);
            
            if (error.code == AMapLocationErrorLocateFailed)
            {
                return;
            }
        }
        
        //定位信息  经纬度
        NSString *lat;
        lat = [NSString stringWithFormat:@"%f|%f",location.coordinate.longitude,location.coordinate.latitude];
        
        UnitySendMessage("Main Camera", "IOSGPSUpdate",[lat UTF8String]);
        
        //逆地理信息
        if (regeocode)
        {
            NSLog(@"reGeocode:%@", regeocode);
        }
    }];
}

- (void)stopActive
{
    [self.locationManager stopUpdatingLocation];
}

@end
