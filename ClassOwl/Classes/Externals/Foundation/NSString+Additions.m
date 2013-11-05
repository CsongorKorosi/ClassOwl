//
//  NSString+Additions.m
//  ForeverMapNGX
//
//  Created by Mihai Babici on 10/17/12.
//  Copyright (c) 2012 Kerekes Marton. All rights reserved.
//

#import "NSString+Additions.h"
#import <Foundation/Foundation.h>

@implementation NSString (Additions)

- (BOOL)isNotEmptyOrWhiteSpace {
    return ([self stringByReplacingOccurrencesOfString:@" " withString:@""].length > 0);
}

- (BOOL)isEmptyOrWhiteSpace {
    return ([self stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0);
}

- (BOOL)containsAnyTokensFromArray:(NSArray *)strArray {
    NSMutableArray *tokens = [NSMutableArray array];
    for (NSString *token in strArray) {
        if ([token isNotEmptyOrWhiteSpace]) {
            [tokens addObject:token];
        }
    }
    
    NSInteger flags = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch | NSWidthInsensitiveSearch;
    for (NSString *token in tokens) {
        if ([self rangeOfString:token options:flags].location != NSNotFound) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)containsAllTokensFromArray:(NSArray *)strArray {
    NSMutableArray *tokens = [NSMutableArray array];
    for (NSString *token in strArray) {
        if ([token isNotEmptyOrWhiteSpace]) {
            [tokens addObject:token];
        }
    }
    
    NSInteger flags = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch | NSWidthInsensitiveSearch;
    for (NSString *token in tokens) {
        if ([self rangeOfString:token options:flags].location == NSNotFound) {
            return NO;
        }
    }
    
    return YES;
}

- (CGSize)sizeWithFontName:(NSString *)fontName size:(CGFloat)fontSize constraint:(CGSize)constraint {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    id font = (id) CTFontCreateWithName((CFStringRef)fontName, fontSize, NULL);

    NSDictionary *attributesDict = @{(id)kCTFontAttributeName : font, (id)kCTKernAttributeName : @0.0};
    CFStringRef stringRef = (CFStringRef)self;
    
    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, stringRef, (CFDictionaryRef)attributesDict);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);

    CGSize size = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, self.length), nil, constraint, NULL);
    
    if (currentText) CFRelease(currentText);
    if (font) CFRelease(font);
    if (framesetter) CFRelease(framesetter);
    
    [pool release];
    
    return CGSizeMake(ceilf(size.width), ceilf(size.height));
}

+ (NSString *)randomStringWithLength:(NSInteger)length {
    NSString *letters = @"abcdef ghijkl mnopqr stuvw xyz ABCDEF GHIJKL MNOPQR STUVW XYZ 0123456789 ";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    
    return randomString;
}

- (NSString*)urlStringWithEncoding:(NSStringEncoding)encoding {
    return [(NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                        (CFStringRef)self,
                                                        NULL,
                                                        (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                        CFStringConvertNSStringEncodingToEncoding(encoding)) autorelease];
}

@end
