//
//  Todo.h
//  ApiBootstraper
//
//  Created by Nicolas BROUSSE on 27/02/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, readonly) NSString *uuid;
@property (nonatomic, strong)   NSString *name;
@property (nonatomic, strong)   NSString *description;
@property (nonatomic, readonly) BOOL is_accomplished;

@property (nonatomic, readonly) NSDate *created_at;
@property (nonatomic, readonly) NSDate *updated_at;

@end
