//
//  Todo.h
//  ApiBootstraper
//
//  Created by Nicolas BROUSSE on 27/02/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import "ABModel.h"

@class User;

@interface Todo : ABModel

@property (readonly)                            NSString *uuid;
@property (readwrite)                           NSString *name;
@property (readwrite)                           NSString *message;
@property (readonly, getter = isAccomplished)   BOOL accomplished;
//@property (readwrite)                           User *user;

@property (readonly)                            NSDate *createdAt;
@property (readonly)                            NSDate *updatedAt;

+ (Todo *)modelObjectWithDictionary:(NSDictionary *)dict;
+ (void)todosWithParameters:(NSDictionary *)dictionary callback:(void (^)(id todosOrOperation, id totalCountOrError))callback;

@end
