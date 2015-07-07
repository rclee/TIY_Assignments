//
//  WinningTicketViewController.m
//  Jackpot
//
//  Created by Apple on 3/4/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "WinningTicketViewController.h"
#import "TicketsTableViewController.h"

@interface WinningTicketViewController ()
@property (weak, nonatomic) IBOutlet UITextField *WinNumText1;
@property (weak, nonatomic) IBOutlet UITextField *WinNumText2;
@property (weak, nonatomic) IBOutlet UITextField *WinNumText3;
@property (weak, nonatomic) IBOutlet UITextField *WinNumText4;
@property (weak, nonatomic) IBOutlet UITextField *WinNumText5;
@property (weak, nonatomic) IBOutlet UITextField *WinNumText6;



@end

@implementation WinningTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}





- (IBAction)CheckWinNumButton:(UIButton *)sender;
{
 
    NSArray *WinButtonArray = @[self.WinNumText1.text,self.WinNumText2.text,self.WinNumText3.text, self.WinNumText4.text, self.WinNumText5.text, self.WinNumText6.text];
   [self.navigationController popToRootViewControllerAnimated:YES];
    
   [self.delegate winningTicketNumberWasChosen:WinButtonArray];
    
    NSLog(@"Winning Array");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
