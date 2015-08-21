//
//  MyApp.h
//  deployOnDayOne
//
//  Created by Zachary Drossman on 1/28/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface MyApp : NSObject

@property (strong, nonatomic) NSString *currentUser;
@property (strong, nonatomic) NSDictionary *userInfo; //Dictionary of Dictionaries


-(void)execute;

-(void)login:(NSMutableArray *)userList;

-(NSString *)mainMenuOptions;
-(void)interviewUser:(Person *)currentUser withQuestionBank:(NSMutableArray *)questionBank;
-(void)addInterviewQuestion:(Person *)currentUser withQuestionBank:(NSMutableArray *)questionBank;
-(void)readPublicInterviews:(NSMutableDictionary*)userList;

@end
