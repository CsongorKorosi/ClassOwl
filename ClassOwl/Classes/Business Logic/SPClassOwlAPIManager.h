//
//  StreamingDataManager.h
//  NetworkRequest
//
//  Created by Kerekes Jozsef-Marton on 10/11/13.
//  Copyright (c) 2013 Jozsef-Marton Kerekes. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SPClassOwlAPIManager;
@class SPUser;

@protocol APIManagerDataProtocol <NSObject>
-(void)dataManagerAuthenticationSuccessful:(SPUser *)userData error:(NSError*)error;
-(void)dataManager:(SPClassOwlAPIManager *)manager didRetrieveResults:(NSArray*)results;
-(void)dataManager:(SPClassOwlAPIManager *)manager failedToRetrieveResultsWithError:(NSError*)error;
-(void)dataManagerRequiresAuthentication;
-(void)dataManagerRequiresSignUp;
@end

@interface SPClassOwlAPIManager : NSObject

+(SPClassOwlAPIManager *)sharedInstance;

@property (nonatomic, assign) id <APIManagerDataProtocol> delegate;

//requires user protocol
-(void)createUser:(NSString *)name password:(NSString*)password address:(NSString*)email didAgree:(BOOL)agreed;
-(void)authenticateUser:(NSString*)user credentials:(NSString*)password;


-(void)retrieveSchoolsWithUser:(SPUser *)user;

@end


