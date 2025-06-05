//
//  GroceryItem+CoreDataProperties.h
//  Gabe's-Fridge
//
//  Created by sofia on 04.06.2025.
//
//

#import "GroceryItem+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GroceryItem (CoreDataProperties)

+ (NSFetchRequest<GroceryItem *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *imageName;
@property (nullable, nonatomic, copy) NSDate *expirationDate;
@property (nullable, nonatomic, copy) NSString *category;

@end

NS_ASSUME_NONNULL_END
