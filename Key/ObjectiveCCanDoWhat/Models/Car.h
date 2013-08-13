//
//  Car.h
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Headlight.h"
#import "SteeringWheel.h"

@interface Car : NSObject

@property (strong) Headlight* headlight;
@property (strong) SteeringWheel* wheel;

@end
