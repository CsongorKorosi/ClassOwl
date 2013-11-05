//
//  MenuTableViewCell.m
//  NetworkRequest
//
//  Created by Jozsef-Marton Kerekes on 9/10/13.
//  Copyright (c) 2013 Jozsef-Marton Kerekes. All rights reserved.
//

#import "MenuTableViewCell.h"
//#import <QuartzCore/QuartzCore.h>

@implementation MenuTableViewCell {
    UIImageView *topShadow;
    UIImageView *bottomShadow;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.textColor = [UIColor blackColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        if (selected) {
            self.imageView.transform = CGAffineTransformMakeTranslation(30, 0);
            self.textLabel.transform = CGAffineTransformMakeTranslation(30, 0);
        } else {
            self.textLabel.transform = CGAffineTransformIdentity;
            self.imageView.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished) {
        
    }];
}

@end
