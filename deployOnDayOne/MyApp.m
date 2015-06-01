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
    NSMutableArray *interviewQuestionsBank = [[NSMutableArray alloc] init];
    
    Person *currentUser = [[Person alloc] init];
    currentUser.userName = [self logon:userList]; //logon checks against list of users, and adds it if it's new.

    NSString *mainMenuChoice = [self mainMenuOptions];
    
    switch ([mainMenuChoice intValue]) {
        case 1:
            interviewUser();
            break;
        case 2:
            addInterviewQuestion();
            break;
        case 3:
            readPublicInterviews();
            break;
     /*
        case 4:
            goBackToLogon();
            break;
        case 5:
            quit();
            break;
        default:
            errorMessageThenDoThisMenuAgain();
            break;
      */
    }

        
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

-(void)interviewUser:(Person *)currentUser
{
    //takes the current user, and the offers a number of questions to answer, or to choose a random one. records the answer in the person's answer NSdictionary.
}

-(void)addInterviewQuestion:(Person *)currentUser
{
    //allows the user to input a quetion to the NSArray question bank.
}

-(void)readPublicInterviews
{
    //allows the user to read the contents of userList answers.
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
