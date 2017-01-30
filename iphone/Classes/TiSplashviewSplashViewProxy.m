/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiSplashviewSplashViewProxy.h"
#import "TiSplashviewSplashView.h"
#import "TiUtils.h"

@implementation TiSplashviewSplashViewProxy

#pragma mark Public API's

- (void)startAnimation:(id)args
{
    ENSURE_UI_THREAD(startAnimation, args);
    
    if ([args count] == 1) {
        KrollCallback *callback = nil;
        ENSURE_ARG_AT_INDEX(callback, args, 0, KrollCallback);
        
        [[[self splashView] splashView] startAnimationWithCompletionHandler:^{
            NSDictionary *propertiesDict = @{@"finished": NUMBOOL(YES)};
            NSArray *invocationArray = [[NSArray alloc] initWithObjects:&propertiesDict count:1];
            
            [callback call:invocationArray thisObject:self];
        }];
    } else if ([args count] == 0) {
        [[[self splashView] splashView] startAnimation];
    } else {
        NSLog(@"[ERROR] Ti.SplashView: Either provide a callback to startAnimation or use it without arguments.");
    }
}

- (void)setAnimationDuration:(id)value
{
    ENSURE_TYPE(value, NSNumber);
    ENSURE_UI_THREAD(setAnimationDuration, value);
    
    [[[self splashView] splashView] setAnimationDuration:[TiUtils floatValue:value]];
}
    
- (void)setIconColor:(id)value
{
    ENSURE_TYPE_OR_NIL(value, NSString);
    ENSURE_UI_THREAD(setIconColor, value);

    [[[self splashView] splashView] setIconColor:[[TiUtils colorValue:value] _color]];
}

- (TiSplashviewSplashView *)splashView
{
    return (TiSplashviewSplashView *)[self view];
}

@end
