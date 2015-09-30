//
//  Global.h
//  Resume
//
//  Created by OkSeJu on 1/25/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef GLOBAL_RESUME
#define GLOBAL_RESUME
#define IS_WIDESCREEN_5 ( [ [ UIScreen mainScreen ] bounds ].size.height == 568 )
#define IS_WIDESCREEN_6 ( [ [ UIScreen mainScreen ] bounds ].size.height == 667 )
#define IS_WIDESCREEN_PLUS ( [ [ UIScreen mainScreen ] bounds ].size.height == 736 )
#define IS_IPHONE     ( [[[UIDevice currentDevice] model] rangeOfString:@"iPhone"].location != NSNotFound )
#define IS_IPAD       ( [[[UIDevice currentDevice] model] rangeOfString:@"iPad"].location != NSNotFound )
#define IS_IPHONE5    ( !IS_IPAD && IS_WIDESCREEN_5 )
#define IS_IPHONE6    ( !IS_IPAD && IS_WIDESCREEN_6 )
#define IS_IPHONEPLUS    ( !IS_IPAD && IS_WIDESCREEN_PLUS )
#endif
