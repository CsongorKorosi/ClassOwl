//
//  CustomSlideMenuDataSourceFactory.m
//  NetworkRequest
//
//  Created by Jozsef-Marton Kerekes on 9/8/13.
//  Copyright (c) 2013 Jozsef-Marton Kerekes. All rights reserved.
//

#import "CustomSlideMenuDataSourceFactory.h"

@implementation CustomSlideMenuDataSourceFactory

+(CustomSlideMenuDataSourceFactory *)mainMenuData {
    
    CustomSlideMenuDataSourceFactory *object = [[self alloc] init];
    object.title = @"Sample";
    object.objects = @[
                       [CustomSlideMenuDataModel profile],
                       [CustomSlideMenuDataModel notifications],
                       [CustomSlideMenuDataModel myPlanner],
                       [CustomSlideMenuDataModel semesters],
                       [CustomSlideMenuDataModel deadlines],
                       [CustomSlideMenuDataModel addCourses]
                       ];
    
    return object;
}
@end
