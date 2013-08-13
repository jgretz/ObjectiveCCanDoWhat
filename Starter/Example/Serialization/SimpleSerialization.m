//
//  SimpleSerialization.m
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import "SimpleSerialization.h"
#import "Introspector.h"
#import "NSObject+IOC.h"

@implementation SimpleSerialization

-(NSArray*) arrayOfType: (Class) classType fromJson: (NSString*) json {
    NSMutableArray* results = [NSMutableArray array];

    for (NSDictionary* dictionary in [self JSONValue: json]) {
        id obj = [classType object];
        [self fillObject: obj fromDictionary: dictionary];
        [results addObject: obj];
    }

    return results;
}

-(void) fillObject: (id) object with: (NSString*) json {
    NSDictionary* bag = [self JSONValue: json];

    [self fillObject: object fromDictionary: bag];
}

-(void) fillObject: (id) object fromDictionary: (NSDictionary*) bag {

    for (NSString* propertyName in [[Introspector object] inspectPropertiesForClass: [object class]]) {
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
