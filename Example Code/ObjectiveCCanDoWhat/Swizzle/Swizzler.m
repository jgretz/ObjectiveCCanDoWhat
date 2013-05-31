//
//  AddDriveTorCar.m
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import <objc/runtime.h>
#import "Swizzler.h"

@implementation Swizzler

-(void) addDriveToClass: (Class) classType {
    IMP drive = imp_implementationWithBlock(^{
        NSLog(@"I'm driving");
    });
    
    class_addMethod(classType, @selector(drive), drive, nil);
}

@end
