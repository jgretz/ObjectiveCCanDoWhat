//
//  Car+Fender.m
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import <objc/runtime.h>
#import "Car+Fender.h"

@implementation Car (Fender)

-(Fender*) fender {
    return objc_getAssociatedObject(self, @"fender");
}

-(void) setFender:(Fender *)fender {
    objc_setAssociatedObject(self, @"fender", fender, OBJC_ASSOCIATION_RETAIN);
}

@end
