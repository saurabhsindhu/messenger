//
//  Newsfeed.h
//  messenger
//
//  Created by saurabh sindhu on 26/02/15.
//  Copyright (c) 2015 saurabh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Newsfeed : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    IBOutlet UITableView *newsfeedTable;

}

@end
