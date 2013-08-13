//
//  SimpleSerialization.h
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleSerialization : NSObject

-(NSArray*) arrayOfType: (Class) classType fromJson: (NSString*) json;
-(void) fillObject: (id) object with: (NSString*) json;

@end
