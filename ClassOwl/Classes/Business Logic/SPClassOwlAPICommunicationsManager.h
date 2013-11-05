//
//  StreamingContentManager.h
//  NetworkRequest
//
//  Created by Kerekes Jozsef-Marton on 10/11/13.
//  Copyright (c) 2013 Jozsef-Marton Kerekes. All rights reserved.
//


typedef void (^ ErrorBlock)(NSError *);
typedef void (^ ExecutionBlock)(id);

@interface SPClassOwlAPICommunicationsManager : NSObject

+(SPClassOwlAPICommunicationsManager *)sharedInstance;

//auth
-(void)createUser:(NSString*)username withCredentials:(NSString*)password email:(NSString*)email agreed:(NSNumber*)didAgree success:(ExecutionBlock)success failure:(ExecutionBlock)failure;
-(void)verifyUser:(NSString*)username withCredentials:(NSString*)password success:(ExecutionBlock)success failure:(ExecutionBlock)failure;

-(void)getSchoolsWithUserToken:(NSString *)token success:(ExecutionBlock)success failure:(ExecutionBlock)failure;
@end
