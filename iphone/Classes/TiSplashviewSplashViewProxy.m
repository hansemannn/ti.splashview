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

- (void)startAnimation:(id)unused
{
    [[[self splashView] splashView] startAnimation];
}

- (void)setIconColor:(id)value
{
    ENSURE_TYPE_OR_NIL(value, NSString);
    [[[self splashView] splashView] setIconColor:[[TiUtils colorValue:value] _color]];
}

#pragma mark Helper

USE_VIEW_FOR_CONTENT_WIDTH

USE_VIEW_FOR_CONTENT_HEIGHT

- (TiDimension)defaultAutoWidthBehavior:(id)unused
{
    return TiDimensionAutoFill;
}

- (TiDimension)defaultAutoHeightBehavior:(id)unused
{
    return TiDimensionAutoFill;
}

- (TiSplashviewSplashView *)splashView
{
    return (TiSplashviewSplashView *)[self view];
}

@end
