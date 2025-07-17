//
//  ViewController.m
//  Gabe's-Fridge
//
//  Created by sofia on 04.06.2025.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "GroceriesListViewController.h"
#import "GroceryItem+CoreDataClass.h"

@interface GroceriesListViewController ()

// private property
@property (nonatomic, strong) NSArray *groceriesArray;

@end

@implementation GroceriesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.groceriesTableView.delegate = self;
    self.groceriesTableView.dataSource = self;

    
    //    MARK: Add New Item (+) button
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self
                                  action:@selector(addButtonTapped:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    
//    MARK: Fetch actual NSArray of GroceryItem objects
    NSFetchRequest *fetchRequest = [GroceryItem fetchRequest];
    NSError *error = nil;
    
//    Get the CoreData context (very important)
    NSManagedObjectContext *context = ((AppDelegate *)UIApplication.sharedApplication.delegate).persistentContainer.viewContext;
    
//    Execute the fetch
    NSArray<GroceryItem *> *results = [context executeFetchRequest:fetchRequest error:&error];

//    Error handling while fetching
    if(error) {
        NSLog(@"Error fetching GroceryItems: %@", error.localizedDescription);
        self.groceriesArray = @[];
    } else {
        self.groceriesArray = results;
        NSLog(@"Successfully fetched %lu grocery items from Core Data.", (unsigned long)self.groceriesArray.count);
    }
    
    [self.groceriesTableView reloadData];
}

// MARK: Add button tapped (show AddNewItem view in modal)
- (void)addButtonTapped:(id)sender {
    NSLog(@"Add item button tapped.");
//        Present AddNewItem view in modal code goes here
};

// MARK: - How many rows in section we need?
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _groceriesArray.count;
}

// MARK: - Which cell to insert at row index path?
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *groceryCell = [tableView dequeueReusableCellWithIdentifier: @"groceryCell"];
    
    GroceryItem *item = self.groceriesArray[indexPath.row];
    
//    Grocery name
    groceryCell.textLabel.text = item.name;
    groceryCell.textLabel.font = [UIFont boldSystemFontOfSize: 15];
     
//    Expiration date formatting
    NSDate *expirationDate = item.expirationDate;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    
//    Ecpiration date label
    NSString *dateString = [formatter stringFromDate:expirationDate];
    groceryCell.detailTextLabel.text = [NSString stringWithFormat: @"Expires on %@", dateString];
    groceryCell.detailTextLabel.font = [UIFont systemFontOfSize: 13];
    
//    MARK: - Add expiration date color logic after AddNewItem screen is implemented
//    Expiration date color
    
    
    
    
    return groceryCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    Add logic for popping up a modal screen with item details once the item is clicked
}


@end
