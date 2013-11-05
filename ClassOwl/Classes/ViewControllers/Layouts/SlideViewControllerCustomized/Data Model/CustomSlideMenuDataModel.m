//
//  CustomSlideMenuDataModel.m
//  NetworkRequest
//
//  Created by Jozsef-Marton Kerekes on 9/8/13.
//  Copyright (c) 2013 Jozsef-Marton Kerekes. All rights reserved.
//

#import "CustomSlideMenuDataModel.h"

@implementation CustomSlideMenuDataModel

+(CustomSlideMenuDataModel *)emptyDataModel {
    
    CustomSlideMenuDataModel *object = [[self alloc] init];
    
    object.title = @"";
    object.iconName = @"";
    object.functionsViewControllerClass = NSClassFromString(@"SPViewController");
    object.completionBlock = ^(){};
    object.requiresNib = YES;
    object.nibName = @"SPViewController";
    object.requiresTransparentNavigationBar = NO;
    object.enabled = YES;
    
    return object;
}

+(CustomSlideMenuDataModel *)profile {
    CustomSlideMenuDataModel *object = [self emptyDataModel];
    object.title = @"Profile";
    object.functionsViewControllerClass = NSClassFromString(@"SPViewController");
    object.nibName = @"SPViewController";
    
    return object;
}
+(CustomSlideMenuDataModel *)notifications {
    CustomSlideMenuDataModel *object = [self emptyDataModel];
    object.title = @"Notifications";
    object.functionsViewControllerClass = NSClassFromString(@"SPViewController");
    object.nibName = @"SPViewController";
    
    return object;
}
+(CustomSlideMenuDataModel *)myPlanner {
    CustomSlideMenuDataModel *object = [self emptyDataModel];
    object.title = @"myPlanner";
    object.functionsViewControllerClass = NSClassFromString(@"SPViewController");
    object.nibName = @"SPViewController";
    
    return object;
}
+(CustomSlideMenuDataModel *)semesters {
    CustomSlideMenuDataModel *object = [self emptyDataModel];
    object.title = @"semesters";
    object.functionsViewControllerClass = NSClassFromString(@"SPViewController");
    object.nibName = @"SPViewController";
    
    return object;
}
+(CustomSlideMenuDataModel *)deadlines {
    CustomSlideMenuDataModel *object = [self emptyDataModel];
    object.title = @"deadlines";
    object.functionsViewControllerClass = NSClassFromString(@"SPViewController");
    object.nibName = @"SPViewController";
    
    return object;
}
+(CustomSlideMenuDataModel *)addCourses {
    CustomSlideMenuDataModel *object = [self emptyDataModel];
    object.title = @"addCourses";
    object.functionsViewControllerClass = NSClassFromString(@"SPViewController");
    object.nibName = @"SPViewController";
    
    return object;
}

-(void)enableOnNotification:(NSNotification *)notification {
    
//    if ([self.title isEqualToString: @"Map"] && [notification.name isEqualToString:@"asdf"]) {
//        self.enabled = YES;
//        [[NSNotificationCenter defaultCenter] removeObserver:self];
//    }
}
@end
