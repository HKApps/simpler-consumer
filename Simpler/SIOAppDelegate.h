//
//  SIOAppDelegate.h
//  Simpler
//
//  Created by Matthew Shultz on 3/12/13.
//  Copyright (c) 2013 SIOApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "KKPasscodeLock.h"


extern NSString *const FBSessionStateChangedNotification;

@interface SIOAppDelegate : UIResponder <UIApplicationDelegate, KKPasscodeViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) UINavigationController * navigationController;
@property (nonatomic, strong) UINavigationController * loginNavigationController;


//Methods
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI;

- (void)showHomeView;
- (void)showLoginView;
- (void)logout;


@end
