//
//  NasaViewController.m
//  NasaPhotos
//
//  Created by Consultant on 8/6/22.
//

#import <Foundation/Foundation.h>
#import "NasaViewController.h"
#import "DetailViewController.h"
#import "NetworkManager.h"
#import "Nasa.h"
#import "NasaTableViewCell.h"
#import "NasaPhotos-Swift.h"

@interface NasaViewController()

@property(nonatomic, weak) UITableView* table;

@property(nonatomic, strong) NasaViewModel* NasaVM;

@end


@implementation NasaViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.table.delegate = self;
    [self setUp];
    self.navigationItem.title = @"Nasa Picture Of The Day";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    [self.NasaVM bindWithUpdateHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.table reloadData];
            
            
        });
    }];
    [self.NasaVM fetchNasainfo];
   
}
-(void)viewWillAppear:(BOOL)animated{
    [self.NasaVM fetchNasainfo];
}

-(void)setUp {

    self.NasaVM = [[NasaViewModel alloc] initWithNetworkManager:[NetworkManager sharedInstance]];
    
    
    UITableView* table = [[UITableView alloc] initWithFrame:CGRectZero];
    [table setTranslatesAutoresizingMaskIntoConstraints:NO];

    [table setDataSource:self];
    [table setPrefetchDataSource:self];
    [table registerClass:[NasaTableViewCell self] forCellReuseIdentifier:@"CellId"];
    
    self.table = table;
    [self.view addSubview:table];
    
    [[table.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8] setActive:YES];
    [[table.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:8] setActive:YES];
    [[table.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-8] setActive:YES];
    [[table.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-8] setActive:YES];
    
    [table setBackgroundColor:[UIColor systemTealColor]];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.NasaVM.count;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NasaTableViewCell* cell = (NasaTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    if (cell == nil) {
        return [[UITableViewCell alloc] init];
    }
    
    [cell.titleLabel setText:[NSString stringWithFormat:@"Title: %@", [self.NasaVM titleFor:indexPath.row]]];
    NSString *dateString = [NSString stringWithFormat:@"%@", [self.NasaVM dateFor:indexPath.row]];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [format dateFromString:dateString];
    [format setDateFormat:@"MM-dd-yyyy"];
    [cell.dateLabel setText:[format stringFromDate:date]];
    [cell.copyrightLabel setText:[NSString stringWithFormat:@"Copyright:\n%@", [self.NasaVM copyrightFor:indexPath.row]]];
    
    [self.NasaVM imageFor:indexPath.row completion:^(UIImage * _Nullable poster) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.posterView setImage:poster];
        });
    }];

    
    return cell;
}

- (void)tableView:(nonnull UITableView *)tableView prefetchRowsAtIndexPaths:(nonnull NSArray<NSIndexPath *> *)indexPaths {
    NSIndexPath* lastIndexPath = [NSIndexPath indexPathForRow:self.NasaVM.count-1  inSection:0];
    if ([indexPaths containsObject:lastIndexPath]) {
     [self.NasaVM fetchNasainfo];

    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DetailViewController *controler = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:controler animated:YES];
    
    
}

@end
