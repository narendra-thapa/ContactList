//
//  main.m
//  ContactList
//
//  Created by Narendra Thapa on 2016-01-12.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    
    NSArray *selectionOption = @[@"new", @"list", @"quit", @"show", @"find", @"history", @"edit"];
    
    NSString *selectedOption = @"okay";
    
    ContactList *savedContacts = [[ContactList alloc] init];
    InputCollector *menuDisplay = [[InputCollector alloc] init];
    
    // While loop checks for user option and exits when choosen
    while (![selectedOption  isEqualToString:@"quit"]) {

        // Asking user for action choice
        selectedOption = [menuDisplay inputForPrompt:@"\nWhat would you like to do next?\nnew - Create a new contact\nlist - List all contacts\nshow - Display one contact using index\nfind - Search using string\nedit - Edit an entry\nhistory - Commands entered by user\nquit - Exit\nApplication > "];
        
        BOOL isPresent = [selectionOption containsObject:selectedOption];
        
        [menuDisplay historyOfCommands:selectedOption];
        
        if ([selectedOption isEqualToString:@"quit"]) {
            
            // Exits program is user chooses to exit
            NSLog(@"Thanks for using the program");
            EXIT_SUCCESS;
        }
        // Asks user for string in case option 1-6 is choosen
        else if (isPresent)
            {
                //NSLog(@"Selection is present");
                if ([selectedOption isEqualToString:@"new"]) {
                    
                    InputCollector *newContact = [[InputCollector alloc] init];
                    NSString *inputNameString = [newContact inputForPrompt:@"Enter the name: "];
                    NSString *inputEmailString = [newContact inputForPrompt:@"Enter the email address:"];

                    Contact *ContactInfo = [[Contact alloc] init];
                    ContactInfo.name = inputNameString;
                    ContactInfo.emailAddress = inputEmailString;
                    
                    // check if already exists
                    BOOL alreadyExists = [savedContacts alreadyExists:ContactInfo.emailAddress];
                    
                    if (alreadyExists)
                    {
                        NSLog(@"Contact already exists");
                    } else
                    {
                        NSString *more = @"y";
                        // while loop asks user if phone number entry is required
                        while (![more isEqualToString:@"n"])
                        {
                            more = [newContact inputForPrompt:@"Do you wish to enter a phone number(y/n)? "];
                            if ([more isEqualToString:@"y"])
                            {
                                NSString *inputPhoneLabelString = [newContact inputForPrompt:@"Enter your phone number label (home, work, mobile, etc): "];
                                NSString *inputPhoneNumberString = [newContact inputForPrompt:@"Please enter phone number as 123-456-7890"];
                                [ContactInfo.phoneBook setValue:inputPhoneNumberString forKey:inputPhoneLabelString];
                            }
                        }
                         [savedContacts addContact:ContactInfo];            // saves data entered by user
                    }
                }
                else if ([selectedOption isEqualToString:@"list"])          // user requests for list of contacts
                {
                    [savedContacts contactDetails];
                }
                else if ([selectedOption isEqualToString:@"show"])          // user requests more details providing index of contact from list
                {
                    InputCollector *showString = [[InputCollector alloc] init];
                    NSString *inputNum = [showString inputForPrompt:@"Please enter index of contact: "];
                    NSUInteger num = [inputNum intValue];                   // Converting user input to integer
                    
                    [savedContacts showOneContactDetails:num];
                }
                else if ([selectedOption isEqualToString:@"edit"])          // to edit the name and email of an existing contact
                {
                    InputCollector *editString = [[InputCollector alloc] init];
                    NSString *inputNum = [editString inputForPrompt:@"Please enter index of contact to be edited: "];
                    NSUInteger num = [inputNum intValue];                   // Converting user input to integer
                    [savedContacts editOneContactDetails:num];
                    
                }
                else if ([selectedOption isEqualToString:@"find"])          // database is searched for string entered by user in name and email field
                {
                    InputCollector *findString = [[InputCollector alloc] init];
                    NSString *inputSearchString = [findString inputForPrompt:@"Enter the search string: "];
                    [savedContacts showExistingContactDetails:inputSearchString];
                }
                else if ([selectedOption isEqualToString:@"history"])       // list the commands history entered by the user
                {
                    [menuDisplay listHistoryOfCommands];
                }
        }
        else {
            // If user inputs something other
            NSLog(@"Invalid Option.");
        }
    }
    return 0;
}
