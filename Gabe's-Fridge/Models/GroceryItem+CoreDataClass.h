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

/// Header for defining what custom logic will be in this data model
@interface GroceryItem : NSManagedObject

// MARK: - Custom data logic for tracking grocery item status
- (BOOL)isExpired;
- (BOOL)isExpiringSoon;
- (UIColor *)expirationColor;

@end

NS_ASSUME_NONNULL_END

#import "GroceryItem+CoreDataProperties.h"
