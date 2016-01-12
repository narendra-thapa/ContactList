//
//  ContactList.m
//  ContactList
//
//  Created by Narendra Thapa on 2016-01-12.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.storedContactList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addContact:(Contact *)newContact {
    [self.storedContactList addObject:newContact];
}

-(void)contactDetails {
    int i = 0;
    NSUInteger count = [self.storedContactList count];
    if (count == 0) {
        NSLog(@"The database is empty");
    } else {
    for (Contact *details in self.storedContactList) {
        //NSLog(@"%d: %@ and %@", i, details.name, details.emailAddress);
        NSLog(@"%d: %@", i, details.name); i++;
        }
    }
}

-(void)showOneContactDetails:(NSUInteger)position {
    NSUInteger count = [self.storedContactList count];
    if (position < count) {
    Contact *OneContact = self.storedContactList[position];
    NSLog(@"%@ %@ %@", OneContact.name, OneContact.emailAddress, OneContact.phoneBook);
    } else {
        NSLog(@"Index value not found in database");
    }
}

-(void)showExistingContactDetails:(NSString *)searchString {
    BOOL found = NO;
    for (Contact *details in self.storedContactList) {
        if ([details.name containsString:searchString] || [details.emailAddress containsString:searchString]) {
            NSLog(@"%@ %@", details.name, details.emailAddress);
            found = YES;
        }
    }
    if (!found) {
        NSLog(@"String not found");
    }
}

-(BOOL)alreadyExists:(NSString *)existsEmailAddress {
    BOOL found = NO;
    for (Contact *details in self.storedContactList) {
        if ([[details.emailAddress lowercaseString] isEqualToString:[existsEmailAddress lowercaseString]]) {
            found = YES;
        }
    }
    return found;
}








@end
