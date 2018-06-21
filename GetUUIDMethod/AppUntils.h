//
//  AppUntils.h
//  GetUUIDMethod
//
//  Created by Simon on 2018/6/20.
//  Copyright © 2018年 sunshixiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUntils : NSObject

+(void)saveUUIDToKeyChain;

+(NSString *)getUUIDFromKeyChain;

@end
