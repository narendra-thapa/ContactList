//
//  InputCollector.h
//  ContactList
//
//  Created by Narendra Thapa on 2016-01-12.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject


-(NSString *)inputForPrompt:(NSString *)promptString;

@property (nonatomic, strong) NSMutableArray *listOfCommands;

-(void)historyOfCommands:(NSString *)userOption;

-(void)listHistoryOfCommands;

@end
