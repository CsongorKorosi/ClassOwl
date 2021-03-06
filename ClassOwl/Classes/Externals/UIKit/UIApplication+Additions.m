//
//  UIApplication+Additions.m
//  ForeverMapNGX
//
//  Created by Mihai Babici on 11/28/12.
//  Copyright (c) 2012 Skobbler. All rights reserved.
//

#import "UIApplication+Additions.h"

@implementation UIApplication (Additions)

static SPAppDelegate *appDelegate = nil;

+ (SPAppDelegate *)appDelegate {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appDelegate = (SPAppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate retain];
    });
    
    return appDelegate;
}

+ (NSString *)getUniqueIdentifier {
    static NSString *udid;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        udid = [[[UIDevice currentDevice] uniqueDeviceID] retain];
    });

    return udid;
}

@end
