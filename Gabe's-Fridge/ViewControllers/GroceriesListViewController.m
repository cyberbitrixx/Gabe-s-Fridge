//
//  ViewController.m
//  Gabe's-Fridge
//
//  Created by sofia on 04.06.2025.
//

#import "GroceriesListViewController.h"

@interface GroceriesListViewController ()

// MARK: - Hard coded array as a data source, will be replaced by actual data later
// private property
@property (nonatomic, strong) NSArray *groceriesArray;

@end

@implementation GroceriesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.groceriesTableView.delegate = self;
    self.groceriesTableView.dataSource = self;
    
//    MARK: - Temporarily nitialize the hard coded array
    self.groceriesArray = @[
        @{@"name": @"Milk", @"expirationDate": @"2025-06-15"},
        @{@"name": @"Cream cheese", @"expirationDate": @"2025-06-12"},
        @{@"name": @"Eggs", @"expirationDate": @"2025-06-09"}
    ];
}

// MARK: - How many rows in section we need?
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _groceriesArray.count;
}

// MARK: - Which cell to insert at row index path?
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *groceryCell = [tableView dequeueReusableCellWithIdentifier: @"groceryCell"];
    
    NSDictionary *item = self.groceriesArray[indexPath.row];
    
    NSString *name = item[@"name"];
    NSString *expirationDate = item[@"expirationDate"];
    
    groceryCell.textLabel.text = name;
    groceryCell.textLabel.font = [UIFont boldSystemFontOfSize: 15];
    
    groceryCell.detailTextLabel.text = [NSString stringWithFormat:@"Expires on %@", expirationDate];
    groceryCell.detailTextLabel.font = [UIFont systemFontOfSize: 13];
    groceryCell.detailTextLabel.textColor = [UIColor redColor];
    
    
    return groceryCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    Add logic for popping up a modal screen with item details once the item is clicked
}


@end
