//
//  GroceryItem+CoreDataProperties.m
//  Gabe's-Fridge
//
//  Created by sofia on 04.06.2025.
//
//

#import "GroceryItem+CoreDataProperties.h"

@implementation GroceryItem (CoreDataProperties)

+ (NSFetchRequest<GroceryItem *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"GroceryItem"];
}

@dynamic name;
@dynamic imageName;
@dynamic expirationDate;
@dynamic category;

@end
