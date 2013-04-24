//
//  Todo.m
//  ApiBootstraper
//
//  Created by Nicolas BROUSSE on 27/02/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import "Todo.h"
#import "User.h"

@implementation Todo

@synthesize
    uuid            = _uuid,
    name            = _name,
    message         = _message,
    accomplished    = _accomplished,

    createdAt       = _createdAt,
    updatedAt       = _updatedAt
;

+ (Todo *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Todo *instance = [[Todo alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];

    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];

        _uuid = [self objectOrNilForKey:@"uuid" fromDictionary:dict];
        _name = [self objectOrNilForKey:@"name" fromDictionary:dict];
        _message = [self objectOrNilForKey:@"description" fromDictionary:dict];
        _accomplished = [dict[@"is_accomplished"] boolValue];
        if (dict[@"created_at"]) _createdAt = [formatter dateFromString:dict[@"created_at"]];
        if (dict[@"updated_at"]) _updatedAt = [formatter dateFromString:dict[@"updated_At"]];
    }

    return self;
}

+ (void)todosWithParameters:(NSDictionary *)dictionary callback:(void (^)(id todosOrOperation, id totalCountOrError))callback {
    [[ABHTTPClient sharedClient] getPath:@"todos/my" parameters:dictionary success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSMutableArray *mutableTodos = NSMutableArray.new;

        for (NSDictionary *attributes in [JSON valueForKeyPath:@"response.todos"]) {
            Todo *todo = [[Todo alloc] initWithDictionary:attributes];

            [mutableTodos addObject:todo];
        }

        if (callback) {
            callback([NSArray arrayWithArray:mutableTodos],
                     [JSON valueForKeyPath:@"response.total"]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (callback) {
            callback(operation, error);
        }
    }];
}

@end
