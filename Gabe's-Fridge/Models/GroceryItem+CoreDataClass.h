//
//  GroceryItem+CoreDataClass.h
//  Gabe's-Fridge
//
//  Created by sofia on 04.06.2025.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// MARK: for myself: this file (and implementation file) are for my editing. I'm supposed to edit them if I want any custom logic

@interface GroceryItem : NSManagedObject

// MARK: - Custom data logic for tracking grocery item status
- (BOOL)isExpired;
- (BOOL)isExpiringSoon;
- (UIColor *)expirationColor;

@end

NS_ASSUME_NONNULL_END

#import "GroceryItem+CoreDataProperties.h"
