//
//  HPDTViewController.h
//  Simpler
//
//  Created by Matthew Shultz on 3/13/13.
//  Copyright (c) 2013 HPDTApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPDTViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    NSManagedObjectContext * ctx;
}
@end
