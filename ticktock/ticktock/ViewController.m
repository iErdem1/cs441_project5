//
//  main.m
//  ticktock
//
//  Created by Erdem Meral on 4/5/19.
//  Copyright © 2019 Ahmed Ihsan Erdem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*for(UIImageView *cell in _cells){
        [cell setImage:[UIImage imageNamed:@"xicon.png"]];
    }*/
    _turn = 0;
    _xScoreVal = 0;
    _oScoreVal = 0;
    [self start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) start{
    _cellValues = [[NSMutableArray alloc] init];
    for(int i =0; i < 9; i++){
        [_cellValues addObject:[NSNumber numberWithInteger:-1]];
        [[_cells objectAtIndex:i] setImage:nil];
    }
}
- (IBAction)restart:(id)sender {
    [self start];
    _xScoreVal = 0;
    _oScoreVal = 0;
    [self updateScore];
}

-(void) updateScore{
    [_xScore setText:[NSString stringWithFormat:@"X: %ld",_xScoreVal]];
    [_oScore setText:[NSString stringWithFormat:@"O: %ld",_oScoreVal]];
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    //NSLog(@"X location: %f", location.x);
    //NSLog(@"Y Location: %f",location.y);
    for(UIImageView *cell in _cells){
        if(CGRectContainsPoint([cell frame], location) && [[_cellValues objectAtIndex:[_cells indexOfObject:cell]] isEqualToValue:[NSNumber numberWithInteger:-1]]){
            if(_turn == 0){
                [cell setImage:[UIImage imageNamed:@"xicon.png"]];
                [_cellValues replaceObjectAtIndex:[_cells indexOfObject:cell] withObject:[NSNumber numberWithInteger:0]];
                _turn = 1;
            }
            else{
                [cell setImage:[UIImage imageNamed:@"oicon.png"]];
                [_cellValues replaceObjectAtIndex:[_cells indexOfObject:cell] withObject:[NSNumber numberWithInteger:1]];
                _turn = 0;
            }
            [self checkEnd];
        }
    }
}


@end
