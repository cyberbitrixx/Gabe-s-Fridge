//
//  ViewController.h
//  Gabe's-Fridge
//
//  Created by sofia on 04.06.2025.
//

#import <UIKit/UIKit.h>

@interface GroceriesListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *groceriesTableView;

@end

