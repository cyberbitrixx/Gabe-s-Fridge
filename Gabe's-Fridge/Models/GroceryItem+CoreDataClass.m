//
//  GroceryItem+CoreDataClass.m
//  Gabe's-Fridge
//
//  Created by sofia on 04.06.2025.
//
//

#import "GroceryItem+CoreDataClass.h"
#import <UIKit/UIKit.h>

// MARK: to myself: this file (and header files) are for me to implement custom logic and be edited

@implementation GroceryItem

// MARK: - Custom logic implementation
- (BOOL)isExpired {
    return [self.expirationDate timeIntervalSinceNow] < 0;
}

- (BOOL)isExpiringSoon {
    NSTimeInterval daysLeft = [self.expirationDate timeIntervalSinceNow];
    return daysLeft > 0 && daysLeft <= (3 * 24 * 60 * 60); // 3 days
}

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
