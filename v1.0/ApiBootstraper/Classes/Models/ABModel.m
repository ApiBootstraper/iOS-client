//
//  ABModel.m
//  ApiBootstraper
//
//  Created by Jeremy on 27/02/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import "ABModel.h"

@implementation ABModel

- (NSString *)description
{
    NSMutableString *string = [NSMutableString stringWithString:@""];
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);

    [string appendString:[NSString stringWithFormat:@"<%@: %p", NSStringFromClass([self class]), self]];

    for (unsigned int i = 0; i < propertyCount; i++)
    {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);

        [string appendString:
            [NSString stringWithFormat:@", %s : \"%@\"",
                        property_getName(properties[i]),
                [self valueForKey:[NSString stringWithCString:name encoding:NSUTF8StringEncoding]]
        ]];
    }

    [string appendString:@">"];

    free(properties);

    return string;
}

@end
