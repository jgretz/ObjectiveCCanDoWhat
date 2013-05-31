//
//  SimpleIOC.h
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleIOC : NSObject

+(SimpleIOC*) defaultInstance;

-(id) objectOfClass: (Class) cls;
-(void) injectObject: (id) object;
-(void) registerClass: (Class) cls1 forClass: (Class) cls2;

@end
