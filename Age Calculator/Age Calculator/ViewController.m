//
//  ViewController.m
//  Age Calculator
//
//  Created by Apple on 3/2/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "DatePickerViewController.h"

@interface ViewController ()
{
    NSInteger ageOfPerson;
    NSDate *dateOfBirth;
    NSDateFormatter *dateFormatBirthdate;
}

@property (weak, nonatomic) IBOutlet UILabel *datesOfBirth;
@property (weak, nonatomic) IBOutlet UILabel *currentDate;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UIButton *setBirthdate;
@property (weak, nonatomic) IBOutlet UIButton *calculateAge;

- (IBAction)calculateAge:(UIButton *)sender;

-(void)findAge;

@end

@implementation ViewController





- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dateFormatBirthdate = [[NSDateFormatter alloc] init];
    
   
    
  
    
  
    
    
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"MMddyyyy"
                                                             options:0
                                                              locale:[NSLocale currentLocale]];
    
    [dateFormatBirthdate setDateFormat:formatString];
    
    
    
    self.title = @"Age Calculator";
   
    self.currentDate.text = [dateFormatBirthdate stringFromDate:[NSDate date]];
    
    

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"setBirthdateSegue"])
    {
        DatePickerViewController *birthdatePickerVC = (DatePickerViewController *)[segue destinationViewController];

        birthdatePickerVC.delegate = self;
        
    }
}

- (void)birthDateWasChosen:(NSDate *)birthDate
{
   
    self.datesOfBirth.text = [dateFormatBirthdate stringFromDate:birthDate];
    dateOfBirth = birthDate;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateAge:(UIButton *)sender
{
    [self findAge];
}

-(void)findAge
{
    NSDateComponents *todayComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitYear fromDate:[NSDate date]];
    
    NSDateComponents *birthdateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitYear fromDate:dateOfBirth];
    
    ageOfPerson = todayComponents.year - birthdateComponents.year;
    
    if (todayComponents.month < birthdateComponents.month)
    {
        ageOfPerson --;
    }
    else if (todayComponents.month == birthdateComponents.month)
    {
        if (todayComponents.day < birthdateComponents.day)
        {
            ageOfPerson --;
        }
    }
    
    self.age.text = [NSString stringWithFormat:@"You are %ld years old!", (long)ageOfPerson];
        
    
}

@end
