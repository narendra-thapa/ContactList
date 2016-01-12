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

@property (nonatomic, strong) NSMutableArray *storedContactList;

-(void)addContact:(Contact *)newContact;

-(void)contactDetails;

@end
