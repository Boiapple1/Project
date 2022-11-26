//
//  ViewController.m
//  MoviesWithObjc6.28
//
//  Created by iAskedYou2nd on 8/1/22.
//

#import "ViewController.h"
#import "PageResult.h"
#import "NetworkManager.h"
#import "Movie.h"
#import "MovieTableViewCell.h"
#import "MoviesWithObjc6_28-Swift.h"

@interface ViewController ()

@property (nonatomic, weak) UITableView* table;
//@property (nonatomic, strong) PageResult* currentPage;
//@property (nonatomic, strong) NSMutableArray* movies;
@property (nonatomic, strong) MoviesViewModel* movieVM;

@end

//@synthesize

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    [self.movieVM bindWithUpdateHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.table reloadData];
        });
    }];
    [self.movieVM fetchMoviePage];
//    [self requestNextPage];
//    [self.movieVM exampleToObjc];
//    [[NetworkManager sharedInstance] doSomething];
}

-(void)setUp {
    
//    self.movies = [[NSMutableArray alloc] init];
    self.movieVM = [[MoviesViewModel alloc] initWithNetworkManager:[NetworkManager sharedInstance]];
    
    UITableView* table = [[UITableView alloc] initWithFrame:CGRectZero];
    [table setTranslatesAutoresizingMaskIntoConstraints:NO];
//    table.translatesAutoresizingMaskIntoConstraints = NO;
    [table setDataSource:self];
    [table setPrefetchDataSource:self];
    [table registerClass:[MovieTableViewCell self] forCellReuseIdentifier:@"CellId"];
    
    self.table = table;
    [self.view addSubview:table];
    
    // Constraints
    [[table.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8] setActive:YES];
    [[table.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:8] setActive:YES];
    [[table.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-8] setActive:YES];
    [[table.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-8] setActive:YES];
    
    [table setBackgroundColor:[UIColor systemTealColor]];
}

//-(void)requestNextPage {
//    NSInteger pageNumber = 1;
//    if (self.currentPage) {
//        pageNumber = self.currentPage.page + 1;
//    }
//
//    [[NetworkManager sharedInstance] fetchMoviesWithPageNumber:pageNumber completion:^(PageResult * _Nullable pageResult) {
//        self.currentPage = pageResult;
//        [self.movies addObjectsFromArray:pageResult.movies];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.table reloadData];
//        });
//    }];
//}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.movies.count;
    return self.movieVM.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MovieTableViewCell* cell = (MovieTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    if (cell == nil) {
        return [[UITableViewCell alloc] init];
    }
    
//    Movie* movie = (Movie*)[self.movies objectAtIndex:indexPath.row];
    [cell.titleLabel setText:[self.movieVM titleFor:indexPath.row]];
    
    [self.movieVM imageFor:indexPath.row completion:^(UIImage * _Nullable poster) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.posterView setImage:poster];
        });
    }];
    
//    [[NetworkManager sharedInstance] fetchImageWithString:movie.posterImage completion:^(UIImage * _Nullable poster) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [cell.posterView setImage:poster];
//        });
//    }];
    
    return cell;
}


- (void)tableView:(nonnull UITableView *)tableView prefetchRowsAtIndexPaths:(nonnull NSArray<NSIndexPath *> *)indexPaths {
    NSIndexPath* lastIndexPath = [NSIndexPath indexPathForRow:self.movieVM.count - 1 inSection:0];
    if ([indexPaths containsObject:lastIndexPath]) {
        [self.movieVM fetchMoviePage];
//        [self requestNextPage];
    }
}


@end
