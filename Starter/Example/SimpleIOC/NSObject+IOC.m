//
//  NSObject+IOC.m
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import "NSObject+IOC.h"
#import "SimpleIOC.h"

@implementation NSObject (IOC)

+(id) object {
    return [SimpleIOC.defaultInstance objectOfClass: [self class]];
}

+(void) overrideClassWithMe: (Class) cls {
    [SimpleIOC.defaultInstance registerClass: [self class] forClass: cls];
}

-(void) markMeForInjection {
    [SimpleIOC.defaultInstance injectObject: self];
}

@end
