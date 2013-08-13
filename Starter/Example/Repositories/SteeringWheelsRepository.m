//
// Created by Joshua Gretz on 8/12/13.
// Copyright (c) 2013 Gretz. All rights reserved.



#import "SteeringWheelsRepository.h"
#import "SimpleSerialization.h"
#import "NSObject+IOC.h"
#import "SteeringWheel.h"


@implementation SteeringWheelsRepository

-(NSString*) json {
    return @"[\n"
            "    {\n"
            "        \"coverType\": \"Leather\"\n"
            "    },\n"
            "    {\n"
            "        \"coverType\": \"Plastic\"\n"
            "    },\n"
            "    {\n"
            "        \"coverType\": \"Rubber\"\n"
            "    }\n"
            "]";
}

-(NSArray*) loadSteeringWheels {
    return [[SimpleSerialization object] arrayOfType: [SteeringWheel class] fromJson: self.json];
}

@end