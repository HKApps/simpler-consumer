//
//  User.h
//  Simpler
//
//  Created by Matthew Shultz on 3/14/13.
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

@end
