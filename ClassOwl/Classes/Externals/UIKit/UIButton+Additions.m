//
//  UIButton+Additions.m
//  ForeverMapNGX
//
//  Created by Mihai Babici on 10/16/12.
//  Copyright (c) 2012 Kerekes Marton. All rights reserved.
//

#import <objc/runtime.h>

#import "UIButton+Additions.h"

static char const * const kFMButtonLandscapeImageKey = "kFMButtonLandscapeImageKey";
static char const * const kFMButtonPortraitImageKey = "kFMButtonPortraitImageKey";
static char const * const kHYNButtonDetailLabelKey = "kHYNButtonDetailLabelKey";
static char const * const kHYNButtonMainLabelKey = "kHYNButtonMainLabelKey";

@implementation UIButton (Additions)

@dynamic landscapeImage;
@dynamic portraitImage;
@dynamic detailLabel;

+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName {
    
    return [UIButton buttonWithFrame:frame title:title backgroundImageNamed:bkImageName highlightedBkImageNamed:hiBkImageName offsetValues:4.0];
}

+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName offsetValues:(float)value {
    
    UIImage *bkImg = [UIImage imageNamed:bkImageName];
    UIImage *hiBkImg = [UIImage imageNamed:hiBkImageName];
    CGFloat horizInset = roundf(bkImg.size.width / 2.0 - value);
    CGFloat vertInset = roundf(bkImg.size.height / 2.0 - value);
    UIEdgeInsets insets = UIEdgeInsetsMake(vertInset, horizInset, vertInset, horizInset);
    bkImg = [bkImg resizableImageWithCapInsets:insets];
    hiBkImg = [hiBkImg resizableImageWithCapInsets:insets];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:12.0];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:bkImg forState:UIControlStateNormal];
    [button setBackgroundImage:hiBkImg forState:UIControlStateHighlighted];
    [button setBackgroundImage:hiBkImg forState:UIControlStateSelected];
    [button setBackgroundImage:hiBkImg forState:UIControlStateHighlighted | UIControlStateSelected];
    
    return button;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title icon:(UIImage *)iconImage backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName {
    UIEdgeInsets insets = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
    UIImage *bkImg = [[UIImage imageNamed:bkImageName] resizableImageWithCapInsets:insets];
    UIImage *hiBkImg = [[UIImage imageNamed:hiBkImageName] resizableImageWithCapInsets:insets];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:iconImage forState:UIControlStateNormal];
    [button setBackgroundImage:bkImg forState:UIControlStateNormal];
    [button setBackgroundImage:hiBkImg forState:UIControlStateHighlighted];
    [button setBackgroundImage:hiBkImg forState:UIControlStateSelected];
    [button setBackgroundImage:hiBkImg forState:UIControlStateHighlighted | UIControlStateSelected];
    
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, button.frameWidth, 20.0)] autorelease];
    if ([UIDevice isiPad]){
        label.frameHeight = 30.0;
    }
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor lightGrayColor];
    label.font = [UIDevice isiPad] ? [UIFont fontWithName:@"Avenir" size:24.0] : [UIFont fontWithName:@"Avenir" size:16.0];
    label.backgroundColor = [UIColor clearColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
    
    button.detailLabel = label;
    [button addSubview:label];
    [button updateDetailLabel];
    
    return button;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName verticalResizableImage:(BOOL)verticalResizable {
    
    UIImage *bkImg = [UIImage imageNamed:bkImageName];
    UIImage *hiBkImg = [UIImage imageNamed:hiBkImageName];
    CGFloat horizInset = bkImg.size.width / 2.0 - 6.0;
    CGFloat vertInset = verticalResizable ? bkImg.size.height / 2.0 - 4.0 : 0.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(vertInset, horizInset, vertInset, horizInset);
    bkImg = [bkImg resizableImageWithCapInsets:insets];
    hiBkImg = [hiBkImg resizableImageWithCapInsets:insets];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:12.0];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:bkImg forState:UIControlStateNormal];
    [button setBackgroundImage:hiBkImg forState:UIControlStateHighlighted];
    [button setBackgroundImage:hiBkImg forState:UIControlStateSelected];
    [button setBackgroundImage:hiBkImg forState:UIControlStateHighlighted | UIControlStateSelected];
    
    return button;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title rightCornerImageName:(NSString *)cornerImageName backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName {
    UIButton *button = [UIButton buttonWithFrame:frame title:title backgroundImageNamed:bkImageName highlightedBkImageNamed:hiBkImageName offsetValues:2.0];
    
    UIImage *cornerImage = [UIImage imageNamed:cornerImageName];
    if (!cornerImage) {
        cornerImage = [UIImage imageNamed:@"poiicons_popup_01.png"];
    }
    UIImageView *cornerImageView = [[UIImageView alloc] initWithImage:cornerImage];
    cornerImageView.frame = CGRectMake(0.0, 0.0, 32.0, 32.0);
    cornerImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    cornerImageView.contentMode = UIViewContentModeCenter;
    [button addSubview:cornerImageView];
    [cornerImageView release];
    button.titleLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:10.0];
    button.contentEdgeInsets = UIEdgeInsetsMake(0.0, 10.0, 0.0, 32.0);
    
    cornerImageView.center = CGPointMake(button.frameWidth - 16, 16.0);
    
    return button;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame imageNamed:(NSString *)imageName backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName {
    UIImage *bkImg = [UIImage imageNamed:bkImageName];
    UIImage *hiBkImg = [UIImage imageNamed:hiBkImageName];
    CGFloat horizInset = roundf(bkImg.size.width / 2.0 - 4.0);
    CGFloat vertInset =  roundf(bkImg.size.height / 2.0 - 4.0);
    UIEdgeInsets insets = UIEdgeInsetsMake(vertInset, horizInset, vertInset, horizInset);
    bkImg = [bkImg resizableImageWithCapInsets:insets];
    hiBkImg = [hiBkImg resizableImageWithCapInsets:insets];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:bkImg forState:UIControlStateNormal];
    [button setBackgroundImage:hiBkImg forState:UIControlStateHighlighted];
    [button setBackgroundImage:hiBkImg forState:UIControlStateSelected];
    [button setBackgroundImage:hiBkImg forState:UIControlStateHighlighted | UIControlStateSelected];
    
    return button;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title leftImageName:(NSString *)cornerImageName backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    UIImage *img = [UIImage imageNamed:cornerImageName];
    
    UIImageView *cornerImageView = [[UIImageView alloc] initWithImage:img];
    cornerImageView.frame = CGRectMake(0.0, 0, 32.0, 32.0);
    cornerImageView.center = CGPointMake(cornerImageView.frameWidth / 2.0+4.0, button.frameHeight / 2.0);
    cornerImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    [button addSubview:cornerImageView];
    [cornerImageView release];
    
    UIImage *bkImg = [UIImage imageNamed:bkImageName];
    UIImage *hiBkImg = [UIImage imageNamed:hiBkImageName];
    CGFloat horizInset = bkImg.size.width / 2.0 - 4.0;
    CGFloat vertInset = bkImg.size.height / 2.0 - 4.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(vertInset, horizInset, vertInset, horizInset);
    bkImg = [bkImg resizableImageWithCapInsets:insets];
    hiBkImg = [hiBkImg resizableImageWithCapInsets:insets];
    
    UIFont *font = [UIFont fontWithName:@"Avenir-Heavy" size:12.0];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(cornerImageView.frameX+cornerImageView.frameWidth, 0, frame.size.width-(cornerImageView.frameX+cornerImageView.frameWidth), frame.size.height)];
    label.text = title;
    label.font = font;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    button.mainLabel = label;
    [button addSubview:label];
    [label release];
    
    [button setBackgroundImage:bkImg forState:UIControlStateNormal];
    [button setBackgroundImage:hiBkImg forState:UIControlStateHighlighted];
    [button setBackgroundImage:hiBkImg forState:UIControlStateSelected];
    [button setBackgroundImage:hiBkImg forState:UIControlStateHighlighted | UIControlStateSelected];
    
    
    return button;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title leftImageName:(NSString *)leftImageName rightImageNamed:(NSString *)rightImageName backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName {
    UIButton *button = [UIButton buttonWithFrame:frame title:title leftImageName:leftImageName backgroundImageNamed:bkImageName highlightedBkImageNamed:hiBkImageName];
    
    UIImage *img = [UIImage imageNamed:rightImageName];
    float accestoryMargin = 8.0;
    UIImageView *cornerImageView = [[UIImageView alloc] initWithImage:img];
    cornerImageView.center = CGPointMake(frame.size.width - img.size.width/2 - accestoryMargin, button.frameHeight / 2.0);
    cornerImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    cornerImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [button addSubview:cornerImageView];
    [cornerImageView release];
    
    button.mainLabel.textAlignment = NSTextAlignmentCenter;
    button.mainLabel.textColor = [UIColor whiteColor];
    button.mainLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:18.0];
    button.mainLabel.frameX += 15.0;
    button.mainLabel.frameWidth -= 15.0;
    
    return button;    
}

+(UIButton *)buttonWithFrame:(CGRect)frame imageNamed:(NSString *)imageName landscapeImage:(NSString *)landscapeImage backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName{
    UIButton *button = [UIButton buttonWithFrame:frame imageNamed:imageName backgroundImageNamed:bkImageName highlightedBkImageNamed:hiBkImageName];
    
    button.landscapeImage = landscapeImage;
    button.portraitImage = imageName;
    
    return button;
}
#pragma mark - Properties

- (void)setLandscapeImage:(NSString *)landscapeImage {
    NSString *currentImage = objc_getAssociatedObject(self, kFMButtonLandscapeImageKey);
    if (currentImage != landscapeImage) {
        objc_setAssociatedObject(self, kFMButtonLandscapeImageKey, landscapeImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)setPortraitImage:(NSString *)portraitImage {
    NSString *currentImage = objc_getAssociatedObject(self, kFMButtonPortraitImageKey);
    if (currentImage != portraitImage) {
        objc_setAssociatedObject(self, kFMButtonPortraitImageKey, portraitImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (NSString*)landscapeImage {
    return objc_getAssociatedObject(self, kFMButtonLandscapeImageKey);
}

- (NSString*)portraitImage {
    return objc_getAssociatedObject(self, kFMButtonPortraitImageKey);
}

-(void)setDetailLabel:(UILabel *)detailsLabel {
    objc_setAssociatedObject(self, kHYNButtonDetailLabelKey, detailsLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)detailLabel {
    return objc_getAssociatedObject(self, kHYNButtonDetailLabelKey);
}

-(void)setMainLabel:(UILabel *)mainLabel {
    objc_setAssociatedObject(self, kHYNButtonMainLabelKey, mainLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)mainLabel {
    return objc_getAssociatedObject(self, kHYNButtonMainLabelKey);
}

#pragma mark - Public methods

- (void)updateDetailLabel {
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    CGFloat deltaBottom = [UIDevice isiPad] ? (UIInterfaceOrientationIsPortrait(orientation) ? 70.0 : 50.0) : 25.0;
    self.detailLabel.frame = CGRectMake(0.0, self.frameHeight - deltaBottom, self.frameWidth, self.detailLabel.frameHeight);
    self.contentEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 25.0, 0.0);
}

@end