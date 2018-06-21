//
//  ViewController.m
//  GetUUIDMethod
//
//  Created by Simon on 2018/6/20.
//  Copyright © 2018年 sunshixiang. All rights reserved.
//

#import "ViewController.h"
#import <AdSupport/AdSupport.h>
#import "UIDevice+DeviceIDByKeychainThisDeviceOnly.h"
#import "AppUntils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1、IDFA(advertisingIdentifier) ---> uuid
    NSString *IDFAUUID = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSLog(@"1、IDFAUUID--->%@",IDFAUUID);
    
    //2、IDFV(identifierForVendor) ---> uuid
    NSString *IDFVUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"2、IDFVUUID*---*>%@",IDFVUUID);
    
    //3、不依赖KeychainItemWrapper ---> uuid
    NSString *deviceUUID = [UIDevice identifierByKeychain];
    NSLog(@"3、identifierByKeychain ---> %@",deviceUUID);
    
    //4、KeychainItemWrapper获取手机UUID,为防止uuid变化，第一次就把uuid存入钥匙串
    NSString *wrapperUUID = [AppUntils getUUIDFromKeyChain];
    NSLog(@"4、wrapperUUID ---> %@",wrapperUUID);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
