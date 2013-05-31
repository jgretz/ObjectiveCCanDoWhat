//
//  Mixin.m
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import <objc/runtime.h>
#import "Mixin.h"

@implementation Mixin

-(void) drive {
    NSLog(@"I'm driving really fast");
}

-(void) addDriveToClass: (Class) classType {
    IMP drive = class_getMethodImplementation([Mixin class], @selector(drive));
    
    class_addMethod(classType, @selector(drive), drive, nil);
}

@end
