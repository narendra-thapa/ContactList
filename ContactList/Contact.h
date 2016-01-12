//
//  Contact.h
//  ContactList
//
//  Created by Narendra Thapa on 2016-01-12.
//  Copyright © 2016 Narendra Thapa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

// Declaring properties to hold contact information 

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *emailAddress;
@property (nonatomic, strong) NSMutableDictionary *phoneBook;

@end
