//
//  GroceryItem+CoreDataClass.m
//  Gabe's-Fridge
//
//  Created by sofia on 04.06.2025.
//
//

#import "GroceryItem+CoreDataClass.h"
#import <UIKit/UIKit.h>

/// This file is for implementing custom data model logic
@implementation GroceryItem

// MARK: - Custom logic implementation
- (BOOL)isExpired {
    return [self.expirationDate timeIntervalSinceNow] < 0;
}

- (BOOL)isExpiringSoon {
    NSTimeInterval daysLeft = [self.expirationDate timeIntervalSinceNow];
    return daysLeft > 0 && daysLeft <= (3 * 24 * 60 * 60); // Item is expiring in 3 days
}

/// Color-code items expiration dates
- (UIColor *)expirationColor {
    if ([self isExpired]) {
        return [UIColor redColor];
    } else if ([self isExpiringSoon]) {
        return [UIColor orangeColor];
    } else {
        return [UIColor greenColor];
    }
}

@end
