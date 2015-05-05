//
//  loginViewController.m
//  Banto
//
//  Created by NEIL on 2015/5/3.
//  Copyright (c) 2015年 NEIL. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController (){
    
    NSUserDefaults *client;
    int bentoNumber;
}
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIView *hidingView;
@property (weak, nonatomic) IBOutlet UIButton *bentoConform;



@end

@implementation loginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    client = [NSUserDefaults standardUserDefaults];
    number = [[NSMutableArray alloc]init];
    
    [number addObject:@"1"];
    [number addObject:@"2"];
    [number addObject:@"3"];
    [number addObject:@"4"];
    [number addObject:@"5"];
    
    
    
    price = [[NSMutableArray alloc]init]; 
    [price addObject:@"100"];
    [price addObject:@"200"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component==0) {
        return [number count];
    }
    else if (component ==1){
        return [price count];}
    return 0;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component==0) {
        return [number objectAtIndex:row];
    }
    else if (component ==1){
        return [price objectAtIndex:row];
    }
    
    return nil;
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component ==0) {
        NSLog(@"%@",[number objectAtIndex:row]);
        [client setObject:[number objectAtIndex:row] forKey:@"number"];
        bentoNumber = [number objectAtIndex:row];
    }
    
    else if (component ==1){
        NSLog(@"%@",[price objectAtIndex:row]);
        [client setObject:[price objectAtIndex:row] forKey:@"price"];
    }
    
}

- (IBAction)bantoPrice:(id)sender {
    [UIView beginAnimations:nil context:NULL];
            [_hidingView setHidden:NO];
            [UIView setAnimationDuration:0.3];
            CGRect frame = _pickerView.frame;
            frame.origin.y -= 292;
            _pickerView.frame = frame;
            [UIView commitAnimations];
    
    
   
}


- (IBAction)tapGesture:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [_hidingView setHidden:YES];
    [UIView setAnimationDuration:0.3];
    CGRect frame = _pickerView.frame;
    frame.origin.y += 292;
    _pickerView.frame = frame;
    [UIView commitAnimations];
    [_bentoConform setTitle:(@"%@", bentoNumber) forState:UIControlStateNormal];
    
    
    
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
