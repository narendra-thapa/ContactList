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
    
    NSArray *selectionOption = @[@"new\n", @"New\n", @"list\n", @"List\n", @"quit\n", @"Quit\n"];
    
    NSString *selectedOption = @"okay";
    
    ContactList *savedContacts = [[ContactList alloc] init];
    
    // While loop checks for user option and exits when choosen
    while (![selectedOption  isEqualToString:@"quit\n"]) {
        
        BOOL isPresent = YES;
        //NSLog(@"%hhd", isPresent);
        
        // Asking user for action choice
        char inputChoice[255];
        NSLog(@"\nWhat would you like to do next?\nnew - Create a new contact\nlist - List all contacts\nquit - Exit\nApplication > ");
        fgets(inputChoice, 255, stdin);
        selectedOption = [NSString stringWithUTF8String:inputChoice];
        
        isPresent = [selectionOption containsObject:selectedOption];
        //NSLog(@"%hhd", isPresent);
        
        if ([selectedOption isEqualToString:@"quit\n"]) {
            
            // Exits program is user chooses to exit
            NSLog(@"Thanks for using the program");
            EXIT_SUCCESS;
        }
        // Asks user for string in case option 1-6 is choosen
        else if (isPresent)
            {
                //NSLog(@"Selection is present");
                if ([selectedOption isEqualToString:@"new\n"]) {
                    InputCollector *New = [[InputCollector alloc] init];
                    NSString *inputNameString = [New inputForPrompt:@"Enter the name: "];
                    //NSLog(@"Hey, you entered %@", inputNameString);
                    NSString *inputEmailString = [New inputForPrompt:@"Enter the email address:"];
                    //NSLog(@"Hey, you entered %@", inputEmailString);
                    
                    Contact *ContactInfo = [[Contact alloc] init];
                    ContactInfo.name = inputNameString;
                    ContactInfo.emailAddress = inputEmailString;
                    [savedContacts addContact:ContactInfo];
                    }
                else if ([selectedOption isEqualToString:@"list\n"])
                {
                    [savedContacts contactDetails];
                }
        }
        else {
            // If user inputs something other
            NSLog(@"Invalid Option.");
        }
    }
    return 0;
}
