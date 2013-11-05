//
//  StreamingUser.m
//  NetworkRequest
//
//  Created by Kerekes Jozsef-Marton on 10/16/13.
//  Copyright (c) 2013 Jozsef-Marton Kerekes. All rights reserved.
//

#import "SPUser.h"

@implementation SPUser

@synthesize identifier,login;

+(SPUser *)userWithDictionary:(NSDictionary *)dictionary{
    
    SPUser *user = [[self alloc] initWithDictionary:dictionary];
    
    return user;
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSString *aToken = [dictionary objectForKey:@"access_token"];
        self.token = aToken;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.token forKey:@"userToken"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.token = [decoder decodeObjectForKey:@"userToken"];
    }
    return self;
}

-(void)save {
    
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:self];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myEncodedObject forKey:@"loggedUser"];
    [defaults synchronize];
}

+(SPUser *)load {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [defaults objectForKey:@"loggedUser"];
    SPUser *obj = (SPUser *)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    return obj;
}


@end
