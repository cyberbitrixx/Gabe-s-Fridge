//
//  AppDelegate.h
//  Gabe's-Fridge
//
//  Created by sofia on 04.06.2025.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

