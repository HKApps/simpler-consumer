//
//  User.h
//  Simpler
//
//  Created by Matthew Shultz on 3/20/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * passcode;
@property (nonatomic, retain) NSNumber * passcode_lock;
@property (nonatomic, retain) NSString * api_token;
@property (nonatomic, retain) NSString * birthdate;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * postal_code;
@property (nonatomic, retain) NSString * consumer_uuid;
@property (nonatomic, retain) NSString * image_url;

@end
