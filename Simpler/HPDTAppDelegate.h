//
//  HPDTAppDelegate.h
//  Simpler
//
//  Created by Matthew Shultz on 3/12/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FacebookSDK/FacebookSDK.h>

extern NSString *const FBSessionStateChangedNotification;

@interface HPDTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) UINavigationController * navigationController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

<<<<<<< HEAD
=======
- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI;

>>>>>>> 785c8fb9d27044d0ed29c9167ae55d05e8899ca1
@end
