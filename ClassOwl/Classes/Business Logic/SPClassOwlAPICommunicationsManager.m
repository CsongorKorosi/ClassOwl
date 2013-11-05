//
//  StreamingContentManager.m
//  NetworkRequest
//
//  Created by Kerekes Jozsef-Marton on 10/11/13.
//  Copyright (c) 2013 Jozsef-Marton Kerekes. All rights reserved.
//

#import "SPClassOwlAPICommunicationsManager.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

//#define devAPIString_8Tracks        @"b9aa449d18fdb7578ff5f88185b7cbd85088737f"

@interface SPClassOwlAPICommunicationsManager (Private)
- (void)performRequest:(NSURLRequest *)urlRequest withSuccessBlock:(ExecutionBlock)successBlock FailureBlock:(ErrorBlock)failureBlock;
-(NSString *)baseURL;
-(NSString *)secureBaseURL;
@end

@implementation SPClassOwlAPICommunicationsManager {
    
    AFHTTPClient *client;
}

+(SPClassOwlAPICommunicationsManager *)sharedInstance {
    static dispatch_once_t onceToken;
    static SPClassOwlAPICommunicationsManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[self baseURL]]];
    }
    return self;
}

-(void)createUser:(NSString*)username withCredentials:(NSString*)password email:(NSString*)email agreed:(NSNumber*)didAgree success:(ExecutionBlock)success failure:(ExecutionBlock)failure {
    
    NSString *path = [NSString stringWithFormat:@"users/me"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[[self baseURL] stringByAppendingPathComponent:path]] cachePolicy:NSURLCacheStorageAllowed timeoutInterval:5];
    
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    
    //setup credentials
    [mutableRequest setHTTPMethod:@"GET"];
    NSString *authStr = [NSString stringWithFormat:@"username=%@&password=%@", username, password];
    NSData *authData = [NSData dataWithBytes:[authStr UTF8String] length:[authStr length]];
    [mutableRequest setHTTPBody:authData];
    
    request = [mutableRequest copy];
    [self performRequest:request withSuccessBlock:success FailureBlock:failure];
}

-(void)verifyUser:(NSString*)username withCredentials:(NSString*)password success:(ExecutionBlock)success failure:(ExecutionBlock)failure {
    
    // http://classowl.linux.greppystudio.com/api/login?username=mobile&password=mobile
    // http://classowl.linux.greppystudio.com/api/login
    
    NSString *path = [NSString stringWithFormat:@"login"];
    path = [path stringByAppendingFormat:@"?username=%@&password=%@", username, password];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[[self baseURL] stringByAppendingPathComponent:path]] cachePolicy:NSURLCacheStorageAllowed timeoutInterval:5];
    
//    NSMutableURLRequest *mutableRequest = [request mutableCopy];
//    
//    //setup credentials
//    [mutableRequest setHTTPMethod:@"GET"];
//    NSString *authStr = [NSString stringWithFormat:@"username=%@&password=%@", username, password];
//    NSData *authData = [NSData dataWithBytes:[authStr UTF8String] length:[authStr length]];
//    [mutableRequest setHTTPBody:authData];
//    
//    request = [mutableRequest copy];    
    [self performRequest:request withSuccessBlock:success FailureBlock:failure];
}

-(void)getSchoolsWithUserToken:(NSString *)token success:(ExecutionBlock)success failure:(ExecutionBlock)failure {
    
    NSString *path = [NSString stringWithFormat:@"v1/schools/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[[self baseURL] stringByAppendingPathComponent:path]] cachePolicy:NSURLCacheStorageAllowed timeoutInterval:5];
    
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    //add API key
//    [mutableRequest addValue:[NSString stringWithFormat:@"OAuth = %@",token] forHTTPHeaderField:@"Authorization"];
//    [mutableRequest addValue:token forHTTPHeaderField:@"OAuth"];
    //Authorization: OAuth <access_token>
    
//    [mutableRequest setHTTPMethod:@"POST"];
//    NSString *authStr = [NSString stringWithFormat:@"OAuth=%@", token];
//    NSData *authData = [NSData dataWithBytes:[authStr UTF8String] length:[authStr length]];
//    [mutableRequest setHTTPBody:authData];

    request = [mutableRequest copy];
    
    [self performRequest:request withSuccessBlock:success FailureBlock:failure];
}

@end

@implementation SPClassOwlAPICommunicationsManager (Private)

- (void)performRequest:(NSURLRequest *)urlRequest withSuccessBlock:(ExecutionBlock)successBlock FailureBlock:(ErrorBlock)failureBlock {
    
    AFHTTPRequestOperation *operation = [client HTTPRequestOperationWithRequest:urlRequest success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }];
    [client enqueueHTTPRequestOperation:operation];
}

-(NSString *)baseURL {
    return @"http://classowl.linux.greppystudio.com/api";
}
-(NSString *)secureBaseURL {
    return @"https://classowl.linux.greppystudio.com/api";
}

@end
