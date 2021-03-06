//
//  UIButton+Additions.h
//  ForeverMapNGX
//
//  Created by Mihai Babici on 10/16/12.
//  Copyright (c) 2012 Kerekes Marton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Additions)

@property (nonatomic, retain) NSString *landscapeImage;
@property (nonatomic, retain) NSString *portraitImage;
@property (nonatomic, assign) UILabel  *mainLabel;
@property (nonatomic, assign) UILabel  *detailLabel;


+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName;
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title icon:(UIImage *)iconImage backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName;
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName verticalResizableImage:(BOOL)verticalResizable;
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title rightCornerImageName:(NSString *)cornerImageName backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName;
+ (UIButton *)buttonWithFrame:(CGRect)frame imageNamed:(NSString *)imageName backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName;
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title leftImageName:(NSString *)cornerImageName backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName;
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title leftImageName:(NSString *)leftImageName rightImageNamed:(NSString *)rightImageName backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName;
+ (UIButton *)buttonWithFrame:(CGRect)frame imageNamed:(NSString *)imageName landscapeImage:(NSString*)landscapeImage backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName;
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title backgroundImageNamed:(NSString *)bkImageName highlightedBkImageNamed:(NSString *)hiBkImageName offsetValues:(float)value;



@end
