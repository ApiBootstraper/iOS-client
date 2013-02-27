//
//  Todo.h
//  ApiBootstraper
//
//  Created by Nicolas BROUSSE on 27/02/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABModel.h"

@class User;

@interface Todo : ABModel

@property (readonly)                            NSString *uuid;
@property (readwrite)                           NSString *name;
@property (readwrite)                           NSString *description;
@property (readonly, getter = isAccomplished)   BOOL accomplished;
@property (readonly)                            User *user;

@property (readonly)                            NSDate *createdAt;
@property (readonly)                            NSDate *updatedAt;

@end
