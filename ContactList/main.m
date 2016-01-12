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
    
    NSArray *selectionOption = @[@"new", @"list", @"quit", @"show", @"find"];
    
    NSString *selectedOption = @"okay";
    
    ContactList *savedContacts = [[ContactList alloc] init];
    
    // While loop checks for user option and exits when choosen
    while (![selectedOption  isEqualToString:@"quit"]) {

        // Asking user for action choice
        InputCollector *menuDisplay = [[InputCollector alloc] init];
        selectedOption = [menuDisplay inputForPrompt:@"\nWhat would you like to do next?\nnew - Create a new contact\nlist - List all contacts\nshow - Display one contact using index\nfind - Search using string\nquit - Exit\nApplication > "];
        
        BOOL isPresent = [selectionOption containsObject:selectedOption];
        
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
                    [savedContacts addContact:ContactInfo];
                    }
                else if ([selectedOption isEqualToString:@"list"])
                {
                    [savedContacts contactDetails];
                }
                else if ([selectedOption isEqualToString:@"show"])
                {
                    InputCollector *showString = [[InputCollector alloc] init];
                    NSString *inputNum = [showString inputForPrompt:@"Please enter index of contact: "];
                    
                    // Converting user input to integer
                    NSUInteger num = [inputNum intValue];
                    [savedContacts showOneContactDetails:num];
                } else if ([selectedOption isEqualToString:@"find"]){
                    
                    InputCollector *findString = [[InputCollector alloc] init];
                    NSString *inputSearchString = [findString inputForPrompt:@"Enter the search string: "];
                    [savedContacts showExistingContactDetails:inputSearchString];
                }
        }
        else {
            // If user inputs something other
            NSLog(@"Invalid Option.");
        }
    }
    return 0;
}
