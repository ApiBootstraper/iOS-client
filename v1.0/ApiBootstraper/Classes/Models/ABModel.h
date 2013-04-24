//
//  ABModel.h
//  ApiBootstraper
//
//  Created by Jeremy on 27/02/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#import "AFHTTPRequestOperation.h"
#import "ABHTTPClient.h"

@interface ABModel : NSObject

- (id)initWithDictionary:(NSDictionary *)dict;
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end
