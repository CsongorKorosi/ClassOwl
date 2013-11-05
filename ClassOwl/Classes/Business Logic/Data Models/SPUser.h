//
//  StreamingUser.h
//  NetworkRequest
//
//  Created by Kerekes Jozsef-Marton on 10/16/13.
//  Copyright (c) 2013 Jozsef-Marton Kerekes. All rights reserved.
//

@interface SPUser : NSObject

@property (nonatomic, strong) NSString *token;

@property (nonatomic, strong) NSNumber      *identifier;
@property (nonatomic, strong) NSString      *login;

- (void)        save;
+ (SPUser *)    load;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+(SPUser*)userWithDictionary:(NSDictionary*)dictionary;

@end
