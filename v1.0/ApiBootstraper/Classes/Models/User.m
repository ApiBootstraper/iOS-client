//
//  User.m
//  ApiBootstraper
//
//  Created by Nicolas BROUSSE on 27/02/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize
    uuid        = _uuid,
    username    = _username,
    email       = _email,

    createdAt   = _createdAt,
    updatedAt   = _updatedAt
;

+ (User *)modelObjectWithDictionary:(NSDictionary *)dict
{
    User *instance = [[User alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];

    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];

        _uuid = [self objectOrNilForKey:@"uuid" fromDictionary:dict];
        _username = [self objectOrNilForKey:@"username" fromDictionary:dict];
        _email = [self objectOrNilForKey:@"email" fromDictionary:dict];
        if (dict[@"created_at"]) _createdAt = [formatter dateFromString:dict[@"created_at"]];
        if (dict[@"updated_at"]) _updatedAt = [formatter dateFromString:dict[@"updated_At"]];
    }

    return self;
}

+ (void)userWithParameters:(NSDictionary *)dictionary callback:(void (^)(id userOrOperation, id errorOrNil))callback {
    [[ABHTTPClient sharedClient] getPath:@"users/my" parameters:dictionary success:^(AFHTTPRequestOperation *operation, id JSON) {
        User *user = [[User alloc] initWithDictionary:[[JSON valueForKeyPath:@"response.user"] copy]];

        if (callback) {
            callback(user, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (callback) {
            callback(operation, error);
        }
    }];
}

@end
