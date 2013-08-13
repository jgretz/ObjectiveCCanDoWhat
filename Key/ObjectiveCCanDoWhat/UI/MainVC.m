//
//  MainVC.m
//  ObjectiveCCanDoWhat
//
//  Created by Joshua Gretz on 5/31/13.
//  Copyright (c) 2013 TrueFit. All rights reserved.
//

#import "MainVC.h"
#import "Car.h"
#import "SteeringWheel.h"
#import "Headlight.h"
#import "Introspector.h"
#import "Car+Honk.h"
#import "Car+Fender.h"
#import "Swizzler.h"
#import "Mixin.h"
#import "NSObject+IOC.h"
#import "Lamborghini.h"
#import "SimpleSerialization.h"

@interface MainVC ()

@end

@implementation MainVC

-(void) viewDidLoad {
    [super viewDidLoad];    
}

-(void) inspect {
    Introspector* introspector = [[Introspector alloc] init];
    NSArray* carProperties = [introspector inspectPropertiesForClass: [Car class]];
    
    for (NSString* name in carProperties)
        NSLog(@"%@", name);
}

-(void) honk: (Car*) car {
    [car honk];
}

-(void) swizzle: (Car*) car {
    Swizzler* swizzler = [[Swizzler alloc] init];
    
    [swizzler addDriveToClass: [Car class]];
    [car performSelector: @selector(drive)];
}

-(void) mixin: (Car*) car {    
    Mixin* mixin = [[Mixin alloc] init];
    
    [mixin addDriveToClass: [Car class]];
    [(id) car drive];
}

-(void) doubleCar {
    [self createHeadlight];
    
    Car* car = [Car object];
    NSLog(@"%@", car.headlight);
    
    Car* car2 = [Car object];
    self.view.backgroundColor = car2.headlight.color;
}

-(void) createHeadlight {
    Headlight* headlight = [Headlight object];
    headlight.color = [UIColor redColor];
    
    [headlight markForInjection];
}

-(void) lamborghini {
    [Lamborghini overrideforClass: [Car class]];
    NSLog(@"%@", [Car object]);
}

-(void) loadWheel {
    SimpleSerialization* serializer = [SimpleSerialization object];
    SteeringWheel* wheel = [SteeringWheel object];
    
    NSString* json = @"{ \"coverType\": \"Leather\" }";
    
    [serializer fillObject: wheel with: json];
    [wheel markForInjection];
}

-(void) allTogether {
    [self loadWheel];
    [self createHeadlight];
    
    Car* car = [Car object];
    NSLog(@"%@ - %@", car.headlight, car.wheel);
}

@end
