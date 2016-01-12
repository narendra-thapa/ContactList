//
//  InputCollector.h
//  ContactList
//
//  Created by Narendra Thapa on 2016-01-12.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject



@property (nonatomic, strong) NSMutableArray *listOfCommands;   // array to hold user commands

-(NSString *)inputForPrompt:(NSString *)promptString;           // method to ask user for input string

-(void)historyOfCommands:(NSString *)userOption;                // method to store user commands

-(void)listHistoryOfCommands;                                   // displays user commands history

@end
