//
//  NSAttributedString+Additions.m
//  ForeverMapNGX
//
//  Created by Mihai Babici on 9/2/13.
//  Copyright (c) 2013 Skobbler. All rights reserved.
//

#import "NSAttributedString+Additions.h"

@implementation NSAttributedString (Additions)

- (CGSize)sizeConstrainedToSize:(CGSize)constraint {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)self);
    
    CGSize size = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, self.length), nil, constraint, NULL);
    
    if (framesetter) CFRelease(framesetter);
    
    [pool release];
    
    return size;
}

@end
