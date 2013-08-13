//
//  Introspector.m
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import <objc/runtime.h>
#import "Introspector.h"

@implementation Introspector

-(NSArray*) inspectPropertiesForClass: (Class) classType {
    unsigned int propertyCount = 0;
    objc_property_t* properties = class_copyPropertyList(classType, &propertyCount);
    
    NSMutableArray* results = [NSMutableArray array];
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t property = properties[i];
        NSString* name = [NSString stringWithCString: property_getName(property) encoding: NSUTF8StringEncoding];
        
        [results addObject: name];
    }
    
    return results;
}

@end
