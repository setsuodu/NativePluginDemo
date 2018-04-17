#import "AmapUnity.h"
#import "AmapGaoDe.h"

@implementation AmapUnity

//Unity to  ios  dayin
AmapGaoDe *iapAmap =nil;

void InitGPSUpdate()
{
    NSLog(@"Msg ==========ios 开始定位");
    iapAmap = [[AmapGaoDe alloc] init];
    [iapAmap startActive];
}

void StartGPSUpdate()
{
    NSLog(@"Msg ===========获取 定位");
    [iapAmap locateAction];
}

void StopGPSUpdate()
{
    NSLog(@"Msg ===========结束 定位");
    [iapAmap locateAction];
}

@end
