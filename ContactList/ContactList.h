//
//  ContactList.h
//  ContactList
//
//  Created by Narendra Thapa on 2016-01-12.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"


@interface ContactList : NSObject

@property (nonatomic, strong) NSMutableArray *storedContactList;        // declaring array to store contacts entered by user

-(void)addContact:(Contact *)newContact;                                // method adds new user details to the database

-(void)contactDetails;                                                  // lists all the contacts in the database

-(void)showOneContactDetails:(NSUInteger)position;                      // displays contact details when requested by user using index from list view

-(void)showExistingContactDetails:(NSString *)searchString;             // displays contacts details when input string matches either name or email address

-(BOOL)alreadyExists:(NSString *)existsEmailAddress;                    // checks if new email address entered by user already exists in database

-(void)editOneContactDetails:(NSUInteger)position;                      // displays contact details when requested by user using index from list view for editing

@end
