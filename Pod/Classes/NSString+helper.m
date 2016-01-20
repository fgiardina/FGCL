//
//  NSString+helper.m
//
//  Created by Fernando Giardina on 7/17/15.
//  Copyright (c) 2015 Fernando Giardina. All rights reserved.
//

#import "NSString+helper.h"

@implementation NSString (helper)


-(NSDate *)toNSDate {

    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate *date = [dateformat dateFromString:self];

    return date;
}

-(NSDate *)toNSDateServer {
    
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    NSTimeZone *tz = [NSTimeZone timeZoneWithName:@"America/New_York"];
    [dateformat setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [dateformat setTimeZone:tz];
    
    NSDate *date = [dateformat dateFromString:self];
    
    return date;
}

-(NSNumber *)toNSNumber {
    return [NSNumber numberWithInteger:[self integerValue]];
}

- (NSString *)validate {

    id obj = self;
    if (obj == [NSNull null]) {
        return @"";
    }
    
    return self;
}
@end
