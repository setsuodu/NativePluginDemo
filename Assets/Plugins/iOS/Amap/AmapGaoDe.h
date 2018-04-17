#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface AmapGaoDe : UIViewController

@property (nonatomic, strong) AMapLocationManager *locationManager;

- (void)startActive;

- (void)locateAction;

- (void)stopAction;

@end  
