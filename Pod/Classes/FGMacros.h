//
//  FGMacros.h
//  FGCommonLibrary
//
//  Created by Fernando Giardina on 1/19/16.
//  Copyright © 2016 Fernando Giardina. All rights reserved.
//

#ifndef FGMacros_h
#define FGMacros_h

#define     FGAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define     FGPatternColor(pngImage) [UIColor colorWithPatternImage:[UIImage imageNamed:pngImage]]

#define     FGStringF(fmt, ...)           [NSString stringWithFormat:fmt, ##__VA_ARGS__]
#define     FGStringFLoc(key, ...)        [NSString stringWithFormat:NSLocalizedString(key,nil), ##__VA_ARGS__]
#define     FGStringInt(integer)          [NSString stringWithFormat:@"%ld", (long)integer]
#define     FGStringFloat(float,decimals) [NSString stringWithFormat:@"%.*f", decimals, float]
#define     FGStringBool(bool)            (bool ? @"YES" : @"NO")

#define     FGDELAYED_DISPATCH(x, t) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (t) * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){ x; })
#define     FGDISPATCH(x) dispatch_async(dispatch_get_main_queue(), ^(void){ x; })

#ifdef DEBUG
//#   define FGDLog( s, ... )          [DebugManager log:[NSString stringWithFormat:(s), ##__VA_ARGS__]]
    #define     FGDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
    #define     FGDLog(...)
#endif

#define     FGrgba(r,g,b,a)			 [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define     FGrgb(r,g,b)				 rgba(r, g, b, 1.0f)

#endif /* FGMacros_h */
