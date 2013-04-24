//
//  ABHTTPClient.m
//  ApiBootstraper
//
//  Created by Jeremy on 18/04/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import "ABHTTPClient.h"

#import "AFNetworking.h"
#import "AFJSONRequestOperation.h"

@implementation ABHTTPClient

static NSString * const kMCAppDotNetAPIBaseURLString = ABDotNetApiBaseUrl;

+ (ABHTTPClient *)sharedClient {
    static ABHTTPClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ABHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:kMCAppDotNetAPIBaseURLString]];
    });

    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }

    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];

    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setParameterEncoding:AFJSONParameterEncoding];

    [self setDefaultHeader:@"X-Api-Version" value:@"1.0.0"];
    [self setDefaultHeader:@"X-APP-ID" value:@"AapdpB1yrpx6veVi"];
    [self setDefaultHeader:@"X-APP-KEY" value:@"zs9kIb3QZl8Fz21TO7SSy1AYgoZ4MBuf"];

    NSString *login = [[NSUserDefaults standardUserDefaults] stringForKey:@"login_preference"];
    NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"pass_preference"];
    [self setAuthorizationHeaderWithUsername:login password:password];

    return self;
}

@end
