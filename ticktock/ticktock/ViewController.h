//
//  main.m
//  ticktock
//
//  Created by Erdem Meral on 4/5/19.
//  Copyright © 2019 Ahmed Ihsan Erdem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(strong,nonatomic) IBOutletCollection(UIImageView) NSArray *cells;
@property (nonatomic) NSMutableArray *cellValues;
@property (nonatomic) NSInteger turn;
@property (strong, nonatomic) IBOutlet UILabel *xScore;
@property (strong, nonatomic) IBOutlet UILabel *oScore;
@property (nonatomic) NSInteger xScoreVal;
@property (nonatomic) NSInteger oScoreVal;
@end

