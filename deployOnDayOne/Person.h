//
//  Person.h
//  deployOnDayOne
//
//  Created by Amitai Blickstein on 6/1/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString *userName; //what it says
@property (strong, nonatomic) NSMutableDictionary *userInfo;

@property(strong) NSMutableDictionary *userResponses; //a record of submitted responses.
//@property(strong) NSArray *questionsThisUserAuthored; //to keep track of who authored what...

-(instancetype)valueWithName:(NSString *)userName userInfo:(NSMutableDictionary*)userInfo;
-(instancetype)initWithName:(NSString*)userName;

@end
