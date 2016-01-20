//
//  UIView+helper.m
//
//  Created by Fernando Giardina on 8/28/15.
//  Copyright (c) 2015 Fernando Giardina. All rights reserved.
//

#import "UIView+helper.h"

@implementation UIView (helper)
- (void)rounded {
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.bounds.size.width/2;
    
}
@end
