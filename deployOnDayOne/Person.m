//
//  Person.m
//  deployOnDayOne
//
//  Created by Amitai Blickstein on 6/1/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithName:(NSString *)userName userInfo:(NSDictionary *)userInfo{
{
        self = [super init];
        if (self) {
            _userName = userName;
            _userInfo = userInfo;
        }
        return self;
    }

}

@end
