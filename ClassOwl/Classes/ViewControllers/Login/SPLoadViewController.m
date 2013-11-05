//
//  SPLoadViewController.m
//  ClassOwl
//
//  Created by Jozsef-Marton Kerekes on 01/11/13.
//  Copyright (c) 2013 Kerekes Jozsef-Marton. All rights reserved.
//

#import "SPLoadViewController.h"
#import "SPClassOwlAPIManager.h"
#import "SPUser.h"

@interface SPLoadViewController () <APIManagerDataProtocol>

@end

@implementation SPLoadViewController

@synthesize status;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    SPUser *user = [SPUser load];
    
    [SPClassOwlAPIManager sharedInstance].delegate = self;
    
    if (user && [user.token isNotEmptyOrWhiteSpace]) {
        [[SPClassOwlAPIManager sharedInstance] retrieveSchoolsWithUser:user];
    } else {
        [[SPClassOwlAPIManager sharedInstance] authenticateUser:@"mobile" credentials:@"mobile"];
    }
    
    
    
    status.text = @"authenticating";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dataManagerAuthenticationSuccessful:(SPUser *)userData error:(NSError *)error {
    
    if (error) {
        status.text = [error description];
    } else {
        status.text = @"Downloading data.";
        
        [[SPClassOwlAPIManager sharedInstance] retrieveSchoolsWithUser:userData];
    }
}

-(void)dataManager:(SPClassOwlAPIManager *)manager didRetrieveResults:(NSArray *)results {
    
}

-(void)dataManager:(SPClassOwlAPIManager *)manager failedToRetrieveResultsWithError:(NSError *)error {
    
}

-(void)dataManagerRequiresAuthentication {
    
}

-(void)dataManagerRequiresSignUp {
    
}
@end
