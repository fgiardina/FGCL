//
//  FGUtils.m
//  FGCommonLibrary
//
//  Created by Fernando Giardina on 1/19/16.
//  Copyright © 2016 Fernando Giardina. All rights reserved.
//

#import "FGUtils.h"

@implementation FGUtils

+(NSString *)getDate{
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSString *dataconFormat = [dateFormatter stringFromDate:date];
    
    NSString *normalizeName = [dataconFormat stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    return [NSString stringWithFormat:@"%@",normalizeName];
}
+ (void)clearTmpDirectory
{
    NSArray* tmpDirectory = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:NSTemporaryDirectory() error:NULL];
    for (NSString *file in tmpDirectory) {
        [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@%@", NSTemporaryDirectory(), file] error:NULL];
    }
}


+(NSString *)downloadFolder{
    
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    NSString *downloadFolder = [documentsPath stringByAppendingPathComponent:@"downloadfolder"];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    BOOL isDirectory;
    if (![fileManager fileExistsAtPath: downloadFolder isDirectory:&isDirectory])
    {
        [fileManager createDirectoryAtPath:downloadFolder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    
    
    return downloadFolder;
}
+ (NSString *)uuid
{
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (__bridge NSString *)uuidStringRef;
}



+ (NSDictionary *)getDictionaryForKey: (NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (NSDictionary *)[defaults objectForKey:key];
}

+ (void)setDictionaryToKey:(NSDictionary *)data key:(NSString *)key withSyncro:(BOOL)withSyncro {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:key];
    
    if(withSyncro)
        [defaults synchronize];
    
}

+ (void)setDictionaryToKey:(NSDictionary *)data key:(NSString *)key {
    [self setDictionaryToKey:data key:key withSyncro:NO];
}




+ (void)setBoolForKey:(BOOL)value key:(NSString *)key withSyncro:(BOOL)withSyncro {
    
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:key];
    if(withSyncro) {
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (NSMutableArray *)getNSMutableArrayForKey: (NSString *)key {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return (NSMutableArray *)[defaults objectForKey:key];
    
}

+ (void)setNSMutableArrayToKey:(NSMutableArray *)data key:(NSString *)key withSyncro:(BOOL)withSyncro {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:key];
    
    if(withSyncro)
        [defaults synchronize];
    
}

+ (void)setNSMutableArrayToKey:(NSMutableArray *)data key:(NSString *)key {
    [self setNSMutableArrayToKey:data key:key withSyncro:NO];
}

+ (BOOL)getBoolForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

+ (NSString *)getAppVersion {
    
    NSString *appData = [NSString stringWithFormat:@"Version %@ (build %@) - %@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"],[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]];
    
    return appData;
}

@end
