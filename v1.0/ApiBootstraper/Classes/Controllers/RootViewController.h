//
//  RootViewController.h
//  ApiBootstraper
//
//  Created by Jeremy on 18/04/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import "CJInfinityScrollTableViewController.h"

@interface RootViewController : CJInfinityScrollTableViewController {
    UINavigationController *navigationController;
}

@property (nonatomic, strong) UINavigationController *navigationController;

@end
