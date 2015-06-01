//
//  MyApp.m
//  deployOnDayOne
//
//  Created by Zachary Drossman on 1/28/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "MyApp.h"


@interface MyApp()

@end


@implementation MyApp

-(void)execute
{
    // Begin writing your code here. This method will kick off automatically.
    NSMutableArray *userList = [[NSMutableArray alloc] init];
    NSMutableDictionary *currentUsername = [self logon:userList];


    
    
}

- (NSMutableDictionary *)logon:(NSMutableArray *)userList
{
    NSLog(@"Welcome to our New Student Learning about the Group (NSLag) interview app! Please enter your existing/new username to begin.");
    NSMutableDictionary *userInput = [self requestKeyboardInput];
    if (![userList doesContain:userInput]) {
        [userList addObject:userInput];
    }
    return userInput;
};



// This method will read a line of text from the console and return it as an NSString instance.
// You shouldn't have any need to modify (or really understand) this method.
-(NSString *)requestKeyboardInput
{
    char stringBuffer[4096] = { 0 };  // Technically there should be some safety on this to avoid a crash if you write too much.
    scanf("%[^\n]%*c", stringBuffer);
    return [NSString stringWithUTF8String:stringBuffer];
}

@end
