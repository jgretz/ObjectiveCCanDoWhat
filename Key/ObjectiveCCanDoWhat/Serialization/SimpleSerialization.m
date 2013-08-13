//
//  SimpleSerialization.m
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import <objc/runtime.h>
#import "SimpleSerialization.h"

@implementation SimpleSerialization

-(void) fillObject: (id) object with: (NSString*) json {
    NSDictionary* bag = [self JSONValue: json];
    
    unsigned int count = 0;
	objc_property_t* properties = class_copyPropertyList([object class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString* propertyName = [NSString stringWithCString: property_getName(property) encoding: NSUTF8StringEncoding];
        
        id value = bag[propertyName];
        if (value)
            [object setValue: value forKey: propertyName];
    }
}

-(id) JSONValue: (NSString*) json {
    NSData* jsonData = [json dataUsingEncoding: NSUTF8StringEncoding];
    NSError* error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData: jsonData options: NSJSONReadingAllowFragments error: &error];
    if (error) {
        NSLog(@"!!! Error Reading JSON: %@", error);
        return nil;
    }
    
    return jsonObj;
}

@end
