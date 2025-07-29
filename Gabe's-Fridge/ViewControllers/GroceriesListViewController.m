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
#import "Gabe_s_Fridge-Swift.h"

/// View Controller for presenting the list of grocery items user has and adding new items to the list
@interface GroceriesListViewController ()

//  MARK: - Private properties
@property (nonatomic, strong) NSArray *groceriesArray;

@end

@implementation GroceriesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.groceriesTableView.delegate = self;
    self.groceriesTableView.dataSource = self;

    
    //    MARK: - Add New Item (+) button
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

// MARK: - "Add" button tapped (show AddNewItem view in modal)
- (void)addButtonTapped:(id)sender {
    UIViewController *addNewItemModal = [SwiftUIViewPresenter createAddNewItemViewController];
    [self presentViewController:addNewItemModal animated:YES completion:nil];
    
};

// MARK: - How many rows in section we need in TableView?
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
    
//    TODO: - Add expiration date color logic after AddNewItem screen is implemented
//    Expiration date color
    
    return groceryCell;
}


/// Row was selected - trigger an action (open a view for individual grocery item from the list)
/// - Parameters:
///   - tableView: table view with grocery items
///   - indexPath: what cell/row was selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    TODO: - Add logic for popping up a modal screen with item details once the item is clicked
}


@end
