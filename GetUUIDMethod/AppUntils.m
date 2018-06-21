//
//  AppUntils.m
//  GetUUIDMethod
//
//  Created by Simon on 2018/6/20.
//  Copyright © 2018年 sunshixiang. All rights reserved.
//

#import "AppUntils.h"
#import "AppKeyChain.h"

#define KUUID @"uuid"

@implementation AppUntils

#pragma mark - 保存和读取UUID
+(void)saveUUIDToKeyChain
{
    // 读取keyChain存储的UUID
    NSString * strUUID = (NSString *)[AppKeyChain loadForKey: KUUID];
    // 首次运行生成一个UUID并用keyChain存储
    if ([strUUID isEqualToString: @""] || !strUUID) {
        // 生成uuid
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        // 将该uuid用keychain存储
        [AppKeyChain saveData: strUUID forKey: KUUID];
    }
}

+(NSString *)getUUIDFromKeyChain
{
    NSString * strUUID = (NSString *)[AppKeyChain loadForKey: KUUID];
    return strUUID;
}

//+ (NSString *)getUUIDString
//{
//    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
//    CFStringRef strRef = CFUUIDCreateString(kCFAllocatorDefault , uuidRef);
//    NSString *uuidString = [(__bridge NSString*)strRef stringByReplacingOccurrencesOfString:@"-" withString:@""]; CFRelease(strRef);
//    CFRelease(uuidRef);
//    return uuidString;
//}

@end
