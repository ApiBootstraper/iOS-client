//
//  User.h
//  ApiBootstraper
//
//  Created by Nicolas BROUSSE on 27/02/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, readonly) NSString *uuid;
@property (nonatomic, strong)   NSString *username;
@property (nonatomic, strong)   NSString *email;

@property (nonatomic, readonly) NSDate *created_at;
@property (nonatomic, readonly) NSDate *updated_at;

@end
