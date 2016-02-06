//
//  ViewController.m
//  Labb2iOS
//
//  Created by Marcus on 2016-02-04.
//  Copyright © 2016 Marcus Cehlin. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (strong, nonatomic) Model *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[Model alloc] init];
    [self updateTexts];
}

- (IBAction)button1Action:(id)sender {
    [self updateAnswer:[sender currentTitle]];
}

- (IBAction)button2Action:(id)sender {
    [self updateAnswer:[sender currentTitle]];
}

- (IBAction)button3Action:(id)sender {
    [self updateAnswer:[sender currentTitle]];
}

- (IBAction)button4Action:(id)sender {
    [self updateAnswer:[sender currentTitle]];
}

- (IBAction)button5Action:(id)sender {
    [self.model nextRound];
    [self updateTexts];
    
}

- (void)updateTexts{
    NSArray *tempArray = [self.model questionTime];
    self.label1.text = tempArray[0];
    [self.button1 setTitle:tempArray[1] forState:(UIControlStateNormal)];
    [self.button2 setTitle:tempArray[2] forState:(UIControlStateNormal)];
    [self.button3 setTitle:tempArray[3] forState:(UIControlStateNormal)];
    [self.button4 setTitle:tempArray[4] forState:(UIControlStateNormal)];
    self.label2.text = @"";
    [self.button5 setTitle:@"" forState:(UIControlStateNormal)];
}

-(void)updateAnswer:(NSString*)buttonNumber{
    NSArray *tempArray = [self.model checkAnswer:buttonNumber];
    self.label2.text = tempArray[0];
    [self.button5 setTitle:tempArray[1] forState:(UIControlStateNormal)];
}

@end
