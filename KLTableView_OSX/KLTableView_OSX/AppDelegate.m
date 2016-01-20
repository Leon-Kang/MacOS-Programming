//
//  AppDelegate.m
//  KLTableView_OSX
//
//  Created by 康梁 on 16/1/20.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import "AppDelegate.h"
#import "Movie.h"

@interface AppDelegate () <NSTableViewDelegate, NSTableViewDataSource>

@property (weak) IBOutlet NSTableView *tableView;

@property (nonatomic, copy) NSArray *movies;

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)awakeFromNib {
    self.movies = [Movie movies];
    for (Movie *item in self.movies) {
        NSLog(@"title: %@", item.title);
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}



#pragma mark TableViewDelegate
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.movies count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSTableCellView *cell = (NSTableCellView *)[tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    NSTextField *textField = cell.textField;
    
    Movie *movie = self.movies[row];
    
    if ([tableColumn.identifier isEqualToString:@"Title"]) {
        
        textField.stringValue = movie.title;
    } else if ([tableColumn.identifier isEqualToString:@"Duration"]) {
        float duration = movie.duration;
        textField.stringValue = [NSString stringWithFormat:@"%2d:%2d",(int)duration/60, (int)duration%60];
    }
    
    return cell;
}

- (void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray<NSSortDescriptor *> *)oldDescriptors {
    
    for(NSSortDescriptor *descriptor in [[tableView sortDescriptors]reverseObjectEnumerator]) {
        
        // _movies = [_movies sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
        
        _movies = [_movies sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            
           return [descriptor compareObject:obj1 toObject:obj2];
        }];
        
        [self.tableView reloadData];
        
    }
    
    
}

@end
