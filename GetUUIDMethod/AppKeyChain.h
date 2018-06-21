//
//  AppKeyChain.h
//  GetUUIDMethod
//
//  Created by Simon on 2018/6/20.
//  Copyright © 2018年 sunshixiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppKeyChain : NSObject

+ (void)saveData:(id)data forKey:(NSString *)key;

+ (id)loadForKey:(NSString *)key;

+ (void)deleteKeyData:(NSString *)key;

@end
