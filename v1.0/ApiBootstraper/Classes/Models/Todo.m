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
    description     = _description,
    accomplished    = _accomplished,

    createdAt       = _createdAt,
    updatedAt       = _updatedAt
;

@end
