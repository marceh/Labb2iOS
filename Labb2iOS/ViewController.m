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
    NSLog(@"Appen startas");
    self.model = [[Model alloc] init];
    NSLog(@"Klarar att initiera Model!");
    [self updateTexts];
}

- (IBAction)button1Action:(id)sender {
    NSLog(@"Nu klickade jag på knapp 1 där sender currentTitle = ");
    NSLog([sender currentTitle]);
    [self updateAnswer:[sender currentTitle]];
}

- (IBAction)button2Action:(id)sender {
    NSLog(@"Nu klickade jag på knapp 2 där sender currentTitle = ");
    NSLog([sender currentTitle]);
    [self updateAnswer:[sender currentTitle]];
}

- (IBAction)button3Action:(id)sender {
    NSLog(@"Nu klickade jag på knapp 3 där sender currentTitle = ");
    NSLog([sender currentTitle]);
    [self updateAnswer:[sender currentTitle]];
}

- (IBAction)button4Action:(id)sender {
    NSLog(@"Nu klickade jag på knapp 4 där sender currentTitle = ");
    NSLog([sender currentTitle]);
    [self updateAnswer:[sender currentTitle]];
}

- (IBAction)button5Action:(id)sender {
    NSLog(@"Nu klickade jag på knapp 5...");
    NSLog(@"Skickar till nextRound");
    [self.model nextRound];
    NSLog(@"Updaterar text");
    [self updateTexts];
    
}

- (void)updateTexts{
        NSLog(@"Hoppade vidare till updateTexts");
    NSArray *tempArray = [self.model questionTime];
        NSLog(@"tempArrayen har hämtats ifrån questionTime den är: ");
            NSLog(tempArray.description);
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
