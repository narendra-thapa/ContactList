//
//  InputCollector.m
//  ContactList
//
//  Created by Narendra Thapa on 2016-01-12.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.listOfCommands = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString *)inputForPrompt:(NSString *)promptString {
    char inputChoice[255];
    NSLog(@"\n%@", promptString);
    fgets(inputChoice, 255, stdin);
    NSString *userString = [NSString stringWithUTF8String:inputChoice];
    NSUInteger length = [userString length];
    userString = [userString substringToIndex:length - 1];
    return userString;
}

-(void)historyOfCommands:(NSString *)userOption {
    [self.listOfCommands addObject:userOption];
}

-(void)listHistoryOfCommands {
    NSUInteger count = [self.listOfCommands count];
    NSLog(@"Number of commands entered: %lu", (unsigned long)count);
    for (int i = 0; i < count; i++) {
        NSLog(@"%@", self.listOfCommands[i]);
    }
}
@end
