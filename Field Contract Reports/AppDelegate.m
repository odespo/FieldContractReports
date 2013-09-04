//
//  AppDelegate.m
//  Field Contract Reports
//
//  Created by Orion Despo on 8/14/13.
//  Copyright (c) 2013 Orion Despo. All rights reserved.
//

#import "AppDelegate.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <AddressBook/AddressBook.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.contacts = [[NSMutableArray alloc]init];
    
    //get addresss book
    //first ask for permission
   [self askContactPermissionandgetcontacts];

    
    
    // Override point for customization after application launch.
    return YES;
}

-(void)askContactPermissionandgetcontacts {

 /*   ABAddressBookRef addressbook = ABAddressBookCreate();
    __block BOOL ret = NO;
    if (ABAddressBookRequestAccessWithCompletion != NULL) {
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        ABAddressBookRequestAccessWithCompletion(addressbook, ^(bool granted, CFErrorRef error) {
            ret = granted;
            dispatch_semaphore_signal(sema);
        });
        if (addressbook) {
            CFRelease(addressbook);
        }
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
     //   dispatch_release(sema);
    } else {
        ret = YES;
    }

    if (ret) {
        if ([self.contacts count] ==0) {
            [self performSelectorInBackground:@selector(retgetcontacts:) withObject:(__bridge id)(addressbook)];
        }
    }
    
    */
    
   ABAddressBookRef ref = ABAddressBookCreateWithOptions(NULL, NULL);
    __block bool ret = NO;
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
        ABAddressBookRequestAccessWithCompletion(ref, ^(bool granted, CFErrorRef error) {
            ret = granted;
        });
        
    } else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ret = YES;
    } else {
        ret = NO;
        //do something
    }
    NSLog(@"%i",ret);
    
    if (ret) {
        [self performSelectorInBackground:@selector(retgetcontacts:) withObject:(__bridge id)(ref)];
    }
}

-(void)retgetcontacts:(ABAddressBookRef) addbookref {
    
    CFArrayRef addcontacts = ABAddressBookCopyArrayOfAllPeople(addbookref);
    CFIndex numcontacts = ABAddressBookGetPersonCount(addbookref);
   CFMutableArrayRef addcontactsmutable = CFArrayCreateMutableCopy(kCFAllocatorDefault, CFArrayGetCount(addcontacts), addcontacts);
    CFArraySortValues(addcontactsmutable, CFRangeMake(0, CFArrayGetCount(addcontactsmutable)), (CFComparatorFunction)ABPersonComparePeopleByName, (void*)kABPersonSortByFirstName);


    
    
    for (int i = 0; i<numcontacts;i++) {
        ABRecordRef record = CFArrayGetValueAtIndex(addcontactsmutable, i);
        NSString *firstname = (__bridge_transfer NSString*)ABRecordCopyValue(record, kABPersonFirstNameProperty);
        NSString *lastname = (__bridge_transfer NSString*)ABRecordCopyValue(record, kABPersonLastNameProperty);
        NSString *fullname = [NSString stringWithFormat:@"%@ %@", firstname, lastname];
        [self.contacts addObject:fullname];

        
    }
    
    NSLog(@"%@",self.contacts);
    
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
