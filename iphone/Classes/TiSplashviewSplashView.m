/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiSplashviewSplashView.h"
#import "TiUtils.h"

@implementation TiSplashviewSplashView

- (CBZSplashView *)splashView
{
    if (splashView == nil) {
        id image = [[self proxy] valueForKey:@"image"];
        id path = [[self proxy] valueForKey:@"path"];
        id fillColor = [[self proxy] valueForKey:@"fillColor"];
    
        ENSURE_TYPE(image, NSString);
        ENSURE_TYPE(fillColor, NSString);
        
        if ((image && path) || (!image && !path)) {
            NSLog(@"[ERROR] Ti.SplashView: Use either a path or an image");
            return;
        }
        
        if (image) {
            splashView = [CBZSplashView splashViewWithIcon:[TiUtils toImage:image proxy:self.proxy] backgroundColor:[[TiUtils colorValue:fillColor] _color]];
        } else if (path) {
            NSLog(@"[ERROR] Ti.SplashView: The path serialization is not implemented, yet!");
        }
        
        [splashView setAutoresizingMask:UIViewAutoresizingNone];
        
        [self addSubview:splashView];
    }
    
    return splashView;
}


#pragma mark Layout utilities

#ifdef TI_USE_AUTOLAYOUT
- (void)initializeTiLayoutView
{
    [super initializeTiLayoutView];
    [self setDefaultHeight:TiDimensionAutoFill];
    [self setDefaultWidth:TiDimensionAutoFill];
}
#endif

#pragma mark Layout helper

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    for (UIView *child in [[self splashView] subviews]) {
        [TiUtils setView:child positionRect:bounds];
    }
    
    [super frameSizeChanged:frame bounds:bounds];
}

@end
