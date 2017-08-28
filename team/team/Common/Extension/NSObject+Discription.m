//
//  NSObject+Description.m
//  SdAccountKeyM
//
//  Created by Dev on 3/31/14.
//  Copyright (c) 2014 snda. All rights reserved.
//

#import "NSObject+Discription.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (Description)

- (NSString *)properties;
{
    NSMutableString *string = [NSMutableString stringWithString:@""];
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    
    for (unsigned int i = 0; i < propertyCount; i++)
    {
        NSString *selector = [NSString stringWithCString:property_getName(properties[i]) encoding:NSUTF8StringEncoding] ;
        
        SEL sel = sel_registerName([selector UTF8String]);
        
        const char *attr = property_getAttributes(properties[i]);
        switch (attr[1]) {
            case '@':
                [string appendString:[NSString stringWithFormat:@"%s : %@\n", property_getName(properties[i]), ((id (*)(id, SEL))objc_msgSend)(self, sel)]];
                break;
            case 'i':
                [string appendString:[NSString stringWithFormat:@"%s : %i\n", property_getName(properties[i]), ((int (*)(id, SEL))objc_msgSend)(self, sel)]];
                break;
            case 'f':
                [string appendString:[NSString stringWithFormat:@"%s : %f\n", property_getName(properties[i]), ((double (*)(id, SEL))(int64_t)objc_msgSend)(self, sel)]];
                break;
            default:
                break;
        }
    }
    
    free(properties);
    
    return string;
}
@end
