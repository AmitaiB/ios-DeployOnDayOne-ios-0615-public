//
//  MyApp.m
//  deployOnDayOne
//
//  Created by Zachary Drossman on 1/28/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "MyApp.h"
#import "Person.h"

@interface MyApp()

@end


@implementation MyApp

-(void)execute
{
    // *********Begin writing your code here. This method will kick off automatically.************
    
    //An NSMA (of Person objects) to keep track of the membership/users
    NSMutableArray *userList = [[NSMutableArray alloc] init];
    
    Person *currentUser = [[Person alloc] init];
    currentUser.userName = [self logon:userList]; //logon checks against list of users, and adds it if it's new.

    NSString *mainMenuChoice = [self mainMenuOptions];

    
    
}

- (NSString *)logon:(NSMutableArray *)userList
{
    NSLog(@"Welcome to our New Student Learning about the Group (NSLag) interview app! Please enter your existing/new username to begin.");
    NSString *userInput = [self requestKeyboardInput];
    if (![userList doesContain:userInput]) {
        [userList addObject:userInput];
        NSLog(@"Welcome back, %@!", userInput);
    } else {
        NSLog(@"Welcome, new user!");
    }
    return userInput;
};

- (NSString *)mainMenuOptions
{
    NSLog(@"Please choose from the following three options:\n1. Be interviewed.\n2. Write a new interview question.\n3. Read an interview with another student.\n4. Logout\n5. Quit\n\nSimply type in the option number you are interested in, and press enter.");
    return [self requestKeyboardInput];
}


// This method will read a line of text from the console and return it as an NSString instance.
// You shouldn't have any need to modify (or really understand) this method.
-(NSString *)requestKeyboardInput
{
    char stringBuffer[4096] = { 0 };  // Technically there should be some safety on this to avoid a crash if you write too much.
    scanf("%[^\n]%*c", stringBuffer);
    return [NSString stringWithUTF8String:stringBuffer];
}

@end
