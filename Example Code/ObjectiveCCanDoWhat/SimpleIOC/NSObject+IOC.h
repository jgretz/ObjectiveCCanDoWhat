//
//  NSObject+IOC.h
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (IOC)

+(id) object;
+(void) overrideforClass: (Class) cls;

-(void) markForInjection;

@end
