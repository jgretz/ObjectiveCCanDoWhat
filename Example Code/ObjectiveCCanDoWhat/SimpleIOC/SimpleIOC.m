//
//  SimpleIOC.m
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import <objc/runtime.h>
#import "SimpleIOC.h"

@implementation SimpleIOC

{
    NSMutableArray* injections;
    NSMutableDictionary* classMaps;
}

#pragma mark - Singleton
static SimpleIOC* instance = nil;
+(SimpleIOC*) defaultInstance {
    if (!instance) {
        instance = [[SimpleIOC alloc] init];
    }
    
    return instance;
}

-(id) init {
    if ((self = [super init])) {
        injections = [NSMutableArray array];
        classMaps = [NSMutableDictionary dictionary];
    }
    
    return self;
}

#pragma mark - IOC / DI
-(id) objectOfClass: (Class) cls {
    // check the map
    Class override = [classMaps objectForKey: NSStringFromClass(cls)];
    if (override)
        cls = override;
    
    // create
    id obj = [[cls alloc] init];
    
    [self buildUp: obj];
    
    return obj;
}

-(void) buildUp: (id) object {
    unsigned int count = 0;
	objc_property_t* properties = class_copyPropertyList([object class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString* propertyName = [NSString stringWithCString: property_getName(property) encoding: NSUTF8StringEncoding];
        Class propertyType = [self returnTypeForProperty: propertyName onClass: [object class]];
        
        for (id injObject in injections)
            if ([injObject isKindOfClass: propertyType])
                [object setValue: injObject forKey: propertyName];
    }
}

-(Class) returnTypeForProperty: (NSString*) propertyName onClass: (Class) classType {
    NSString* infoString = [NSString stringWithUTF8String: property_getAttributes(class_getProperty(classType, [propertyName UTF8String]))];
    NSArray* propertyParts = [infoString componentsSeparatedByString: @","];
    
    return NSClassFromString([[[propertyParts objectAtIndex: 0] stringByReplacingOccurrencesOfString: @"T@\"" withString: @""] stringByReplacingOccurrencesOfString: @"\"" withString: @""]);
}

#pragma mark - Configuration
-(void) injectObject: (id) object {
    [injections addObject: object];
}

-(void) registerClass: (Class) cls1 forClass: (Class) cls2 {
    [classMaps setObject: cls1 forKey: NSStringFromClass(cls2)];
}


@end
