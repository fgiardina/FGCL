//
//  FGUtils.h
//  FGCommonLibrary
//
//  Created by Fernando Giardina on 1/19/16.
//  Copyright © 2016 Fernando Giardina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGUtils : NSObject
+ (NSString *)getDate;
+ (void)clearTmpDirectory;
+ (NSString *)downloadFolder;
+ (NSString *)uuid;
+ (NSDictionary *)getDictionaryForKey: (NSString *)key;
+ (void)setDictionaryToKey:(NSDictionary *)data key:(NSString *)key withSyncro:(BOOL)withSyncro;
+ (void)setDictionaryToKey:(NSDictionary *)data key:(NSString *)key;
+ (void)setBoolForKey:(BOOL)value key:(NSString *)key withSyncro:(BOOL)withSyncro;
+ (NSMutableArray *)getNSMutableArrayForKey: (NSString *)key;
+ (void)setNSMutableArrayToKey:(NSMutableArray *)data key:(NSString *)key withSyncro:(BOOL)withSyncro;
+ (void)setNSMutableArrayToKey:(NSMutableArray *)data key:(NSString *)key;
+ (BOOL)getBoolForKey:(NSString *)key;
+ (NSString *)getAppVersion;

@end
