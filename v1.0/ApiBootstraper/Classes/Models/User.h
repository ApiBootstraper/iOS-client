//
//  User.h
//  ApiBootstraper
//
//  Created by Nicolas BROUSSE on 27/02/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABModel.h"

@interface User : ABModel

@property (readonly)    NSString *uuid;
@property (readwrite)   NSString *username;
@property (readwrite)   NSString *email;

@property (readonly)    NSDate *createdAt;
@property (readonly)    NSDate *updatedAt;

@end
