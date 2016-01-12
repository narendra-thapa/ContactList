//
//  Contact.m
//  ContactList
//
//  Created by Narendra Thapa on 2016-01-12.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.phoneBook = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end
