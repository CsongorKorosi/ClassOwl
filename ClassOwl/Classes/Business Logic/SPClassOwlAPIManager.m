//
//  StreamingDataManager.m
//  NetworkRequest
//
//  Created by Kerekes Jozsef-Marton on 10/11/13.
//  Copyright (c) 2013 Jozsef-Marton Kerekes. All rights reserved.
//

#import "SPClassOwlAPIManager.h"
#import "SPClassOwlAPICommunicationsManager.h"
#import "SPUser.h"


@implementation SPClassOwlAPIManager

@synthesize delegate;

+(SPClassOwlAPIManager *)sharedInstance {
    static dispatch_once_t onceToken;
    static SPClassOwlAPIManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark - user auth section

-(void)createUser:(NSString *)name password:(NSString*)password address:(NSString*)email didAgree:(BOOL)agreed {
    
    [[SPClassOwlAPICommunicationsManager sharedInstance] createUser:name withCredentials:password email:email agreed:[NSNumber numberWithBool:agreed] success:^(NSData *response) {
        [self authenticateSuccessful:response];
    } failure:^(NSError *error) {
        [self authenticationFailed:error];
    }];
}

-(void)authenticateUser:(NSString*)user credentials:(NSString*)password {
    
    [[SPClassOwlAPICommunicationsManager sharedInstance] verifyUser:user withCredentials:password success:^(NSData *response) {
        [self authenticateSuccessful:response];
    } failure:^(NSError *error) {
        [self authenticationFailed:error];
    }];
}

-(BOOL)authenticateSuccessful:(NSData*)data {
    
    NSError *error = nil;
    NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
    
    SPUser *userObject = [SPUser userWithDictionary:object];
    
    [userObject save];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(dataManagerAuthenticationSuccessful:error:)]) {
        [self.delegate dataManagerAuthenticationSuccessful:userObject error:nil];
    }
    
    return YES;
}

-(void)authenticationFailed:(NSError*)error {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(dataManagerAuthenticationSuccessful:error:)]) {
        [self.delegate dataManagerAuthenticationSuccessful:nil error:error];
    }
}


#pragma mark - Schools

-(void)retrieveSchoolsWithUser:(SPUser *)user {
    
    [[SPClassOwlAPICommunicationsManager sharedInstance] getSchoolsWithUserToken:user.token success:^(NSData * response) {
        NSError *error = nil;
        NSDictionary *object = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:&error];
        NSLog(@"%@",object.description);
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

@end
