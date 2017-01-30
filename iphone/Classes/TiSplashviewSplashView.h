/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiUIView.h"
#import "CBZSplashView.h"

@interface TiSplashviewSplashView : TiUIView {
    CBZSplashView *splashView;
    
    TiDimension width;
    TiDimension height;
    CGFloat autoHeight;
    CGFloat autoWidth;
}

- (CBZSplashView *)splashView;

@end
