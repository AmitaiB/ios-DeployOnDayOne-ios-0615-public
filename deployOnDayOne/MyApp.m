//
//  MyApp.m
//  deployOnDayOne
//
//  Created by Zachary Drossman on 1/28/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "MyApp.h"
#import "Person.h"
#define DBLG NSLog(@"%@ reporting!", NSStringFromSelector(_cmd));


@interface MyApp()

@end


@implementation MyApp

-(void)execute
{
    // *********Begin writing your code here. This method will kick off automatically.************
    
    NSMutableArray *userList = [NSMutableArray new];
    
    //initialize a pre-populated question bank
    
    NSMutableDictionary *interviewQuestionsBank = [[NSMutableDictionary alloc] initWithDictionary:
                                                    @{@"nameQuestion"     : @"WHAT is thy name?",
                                                      @"questQuestion"    : @"WHAT is thy quest?",
                                                      @"favColorQuestion" : @"WHAT is thy favourate colour?",
                                                      @"surpriseQuestion" : @"WHAT is air-speed of an unladen swallow?"}
                                                                                        copyItems:YES];
    
    [self login:userList];
    
    Person *currentUser = [[Person alloc] initWithName:self.currentUser];
    
    
    NSString *mainMenuChoice = [self mainMenuOptions];
    
    switch ([mainMenuChoice intValue]) {
        case 1:
            [self interviewUser:currentUser withQuestionBank:interviewQuestionsBank];
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

- (void)login:(NSMutableArray *)userList
{
    NSLog(@"Welcome to our New Student Learning about the Group (NSLag) interview app! Please enter your existing/new username to begin.");
    NSString *userInput = [self requestKeyboardInput];
    if (![userList doesContain:userInput]) {
        [userList addObject:userInput];
        NSLog(@"Welcome, new user!");
    } else {
        NSLog(@"Welcome back, %@!", userInput);
    }
    self.currentUser = userInput;
};

- (void)logout {
    self.currentUser = @"";
    DBLG
}

- (void)mainMenuOptions
{
    NSLog(@"Please choose from the following three options:\n1. Be interviewed.\n2. Write a new interview question.\n3. Read an interview with another student.\n4. Logout\n5. Quit\n\nSimply type in the option number you are interested in, and press enter.");
    NSString * userInput = [self requestKeyboardInput];
    if ([@([userInput integerValue]) isKindOfClass:[NSNumber class]]) {
        switch ([userInput integerValue]) {
            case 1: //TODO:
                    //be interviewed
                break;
            case 2:
                    //add new interview question
                break;
            case 3:
                    //Read another's interview info
                break;
            case 4:
                [self logout];    //logout
                break;
            case 5:
                    //quit
                break;
            default:
                break;
        }
    }
    
    
}

-(void)interviewUser:(Person *)currentUser withQuestionBank:(NSMutableDictionary *)questionBank
{
    //takes the current user, and offers a number of questions to answer, or to choose a random one.
    //records the answer in the person's answer NSdictionary.
    NSLog(@"Please enter the number that corresponds to the question you would like to answer, or \"R\" to answer a question at random.");
    
    //iterate through the question bank to get "1) question one?, 2) question two?..."
    [questionBank enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"%@ %@/n", key, obj);
    }];
    //FFR: Sorting an NSDictionary: http://stackoverflow.com/questions/4558639/sort-an-nsmutabledictionary
     
    NSString *userChoice = [self requestKeyboardInput];
    NSMutableString *mutableUserChoice = [[NSMutableString alloc] initWithString:userChoice]; //a mutable copy of userChoice
    
    /*
     if (userChoice == @"R") {
        NSNumber *temp = [NSNumber alloc] initWithUnsignedLong:[([[currentUser.userResponses allKeys] count] * random()) round];
                mutableUserChoice
    }
     */
    
    
    //conditions allow for pressing NaN or a 'wrong' number.
    while (![[questionBank allKeys] doesContain:mutableUserChoice] || [[currentUser.userResponses allKeys] doesContain:mutableUserChoice]) {
        if (![[questionBank allKeys] doesContain:mutableUserChoice])
            NSLog(@"That's not a possible choice today! Choose another, please.");
        if ([[currentUser.userResponses allKeys] doesContain:mutableUserChoice]) {
            NSLog(@"You've already answered that question! Choose another, please.");
        }
        NSString *userChoice = [self requestKeyboardInput];
        NSMutableString *temp = [[NSMutableString alloc] initWithString:userChoice]; //a mutable copy of userChoice
        mutableUserChoice = temp; //this should escape the scope of the while loop...
    }
    
    NSLog(@"%@, you chose to answer this question:\n%@", currentUser.userName, questionBank[mutableUserChoice]);
    [currentUser.userResponses setObject:[self requestKeyboardInput] forKey:[NSString stringWithFormat:@"%lul", (unsigned long)[questionBank count]]];
    
}


//    allows the user to input a quetion to the NSArray question bank.
//
-(void)addInterviewQuestion:(Person *)currentUser withQuestionBank:questionBank
{

    NSLog(@"Please enter your query in the form of a question:");
     //Enters user's response as an object in the questionBank, keyed to the container's count (e.g., if there were 4 objects, the new one is keyed to "5", etc. etc.)
    [questionBank setObject:[self requestKeyboardInput] forKey:[NSString stringWithFormat:@"%lul", (unsigned long)[questionBank count]]];

}

//    allows the user to read the contents of userList answers.
//
-(void)readPublicInterviews:(NSMutableArray *)userList
{
    NSLog(@"Whose interview would you like to read?");
    for (NSInteger i; i < [userList count]; i++) {
        NSLog(@"%ldl) %@", (long)i, ((Person *)userList[i]).userName);
    }
    
//    for (Person *users in userList) {
//        NSLog(@"%@", users.userName);
//    }
    NSLog(@"Please type the desired username.");
    NSString *userChoice = [self requestKeyboardInput];
    
    NSMutableString *interviewToDisplay = [NSMutableString stringWithCapacity:0];
    NSArray *keysToQuestionsSelectedUserAnswered = userList //STOPPED HERE
    
    [interviewToDisplay appendString:"\nQuestion %@: %@\n\n%@'s Response:\n%@", ];
//    question #
//    question text
//    username
//    username's response
    
    NSLog(@"%@", interviewToDisplay);
    
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
