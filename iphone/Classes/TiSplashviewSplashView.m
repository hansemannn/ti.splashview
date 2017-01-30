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
        id backgroundColor = [[self proxy] valueForKey:@"backgroundColor"];
        id iconStartSize = [[self proxy] valueForKey:@"iconStartSize"];
    
        ENSURE_TYPE(image, NSString);
        ENSURE_TYPE(backgroundColor, NSString);
        ENSURE_TYPE_OR_NIL(iconStartSize, NSDictionary);
        
        splashView = [CBZSplashView splashViewWithIcon:[TiUtils image:image proxy:self.proxy] backgroundColor:[[TiUtils colorValue:backgroundColor] _color]];
        
        if (iconStartSize) {
            [splashView setIconStartSize:CGSizeMake(300,300)];
        }
        
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

#pragma mark Public APIs

- (void)setWidth_:(id)width_
{
    width = TiDimensionFromObject(width_);
    [self updateContentMode];
}

- (void)setHeight_:(id)height_
{
    height = TiDimensionFromObject(height_);
    [self updateContentMode];
}

#pragma mark Layout helper

- (void)updateContentMode
{
    if (self != nil) {
        [self setContentMode:[self contentModeForFluidView]];
    }
}

- (UIViewContentMode)contentModeForFluidView
{
    if (TiDimensionIsAuto(width) || TiDimensionIsAutoSize(width) || TiDimensionIsUndefined(width) ||
        TiDimensionIsAuto(height) || TiDimensionIsAutoSize(height) || TiDimensionIsUndefined(height)) {
        return UIViewContentModeScaleAspectFit;
    } else {
        return UIViewContentModeScaleToFill;
    }
}

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    for (UIView *child in [[self splashView] subviews]) {
        [TiUtils setView:child positionRect:bounds];
    }
    
    [super frameSizeChanged:frame bounds:bounds];
}

- (CGFloat)contentWidthForWidth:(CGFloat)suggestedWidth
{
    if (autoWidth > 0) {
        //If height is DIP returned a scaled autowidth to maintain aspect ratio
        if (TiDimensionIsDip(height) && autoHeight > 0) {
            return roundf(autoWidth*height.value/autoHeight);
        }
        return autoWidth;
    }
    
    CGFloat calculatedWidth = TiDimensionCalculateValue(width, autoWidth);
    if (calculatedWidth > 0) {
        return calculatedWidth;
    }
    
    return 0;
}

- (CGFloat)contentHeightForWidth:(CGFloat)width_
{
    if (width_ != autoWidth && autoWidth>0 && autoHeight > 0) {
        return (width_*autoHeight/autoWidth);
    }
    
    if (autoHeight > 0) {
        return autoHeight;
    }
    
    CGFloat calculatedHeight = TiDimensionCalculateValue(height, autoHeight);
    if (calculatedHeight > 0) {
        return calculatedHeight;
    }
    
    return 0;
}

- (UIViewContentMode)contentMode
{
    if (TiDimensionIsAuto(width) || TiDimensionIsAutoSize(width) || TiDimensionIsUndefined(width) ||
        TiDimensionIsAuto(height) || TiDimensionIsAutoSize(height) || TiDimensionIsUndefined(height)) {
        return UIViewContentModeScaleAspectFit;
    } else {
        return UIViewContentModeScaleToFill;
    }
}

@end
