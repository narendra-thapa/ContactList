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
    for (Contact *details in self.storedContactList) {
        int i = 0;
        //NSLog(@"%d: %@ and %@", i, details.name, details.emailAddress);
        NSLog(@"%d: %@", i, details.name); i++;
    }
    
}
@end
