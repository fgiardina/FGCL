//
//  NSString+helper.h
//
//  Created by Fernando Giardina on 7/17/15.
//  Copyright (c) 2015 Fernando Giardina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface  NSString (helper)
- (NSDate *)toNSDate;
- (NSDate *)toNSDateServer;
- (NSNumber *)toNSNumber;
- (NSString *)validate;
@end
