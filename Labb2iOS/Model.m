//
//  Model.m
//  Labb2iOS
//
//  Created by Marcus on 2016-02-04.
//  Copyright © 2016 Marcus Cehlin. All rights reserved.
//

#import "Model.h"

@interface Model()
@property (nonatomic) NSArray *q0;
@property (nonatomic) NSArray *q1;
@property (nonatomic) NSArray *q2;
@property (nonatomic) NSArray *q3;
@property (nonatomic) NSArray *q4;
@property (nonatomic) NSArray *q5;
@property (nonatomic) NSArray *q6;
@property (nonatomic) NSArray *q7;
@property (nonatomic) NSArray *q8;
@property (nonatomic) NSArray *q9;
@property (nonatomic) NSMutableArray *questionsAvailable;
@property (nonatomic) NSString *currentAnswer;
@property (nonatomic) int round;
@property (nonatomic) int score;
@property (nonatomic) NSString *wrongAnswer;
@property (nonatomic) NSString *correctAnswer;
@property (nonatomic) NSString *nextQuestion;
@property (nonatomic) NSString *playAgain;
@property (nonatomic) NSMutableArray *endOfRound;
@property (nonatomic) NSNumber *yesBool;
@property (nonatomic) NSNumber *noBool;
@property (nonatomic) BOOL guessedThisRound;

@end


@implementation Model



- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initValues];
    }
    return self;
}


-(NSArray*)questionTime{
    self.guessedThisRound = NO;
    int randomInt = arc4random() % self.questionsAvailable.count;
    if (self.questionsAvailable[randomInt] == self.yesBool) {
        [self.questionsAvailable replaceObjectAtIndex:randomInt withObject:self.noBool];
        return [self correspondingQuestion:randomInt];
    } else {
        return [self questionTime];
    }
}

-(NSArray*)checkAnswer:(NSString*)guess{
    if ([guess isEqualToString:self.currentAnswer]) {
        if (!self.guessedThisRound) {
            self.score ++;
        }
        [self.endOfRound replaceObjectAtIndex:0 withObject:self.correctAnswer];
    } else {
        [self.endOfRound replaceObjectAtIndex:0 withObject:self.wrongAnswer];
    }
    [self.endOfRound replaceObjectAtIndex:1 withObject:[self howManyRounds]];
    self.guessedThisRound = YES;
    return self.endOfRound;
}

-(void)nextRound {
    self.round ++;
    if (self.round == 6) {
        [self resetQuestionsAvailable];
        self.round = 1;
        self.score = 0;
    }
}

-(NSString*)howManyRounds{
    if (self.round < 5) {
        return self.nextQuestion;
    } else {
        self.playAgain = [NSString stringWithFormat:@"(%d poäng) - Spela igen?",self.score];
        return self.playAgain;
    }
}

-(void)resetQuestionsAvailable {
    for (int i = 0; i < self.questionsAvailable.count; i++) {
        [self.questionsAvailable replaceObjectAtIndex:i withObject:self.yesBool];
    }
}

-(void)initValues{
    self.q0 = @[@"I vilken stad bor det flest pirater?", @"Arrrrrrboga", @"Göteborg", @"Piratviken", @"Kroksdal", @"Arrrrrrboga"];
    self.q1 = @[@"Hur många människor bor det i Tysklad?", @"100 000", @"Gööööörmäny", @"Väldigt många", @"45 976 809", @"Gööööörmäny"];
    self.q2 = @[@"Hur många göteborgare bor det i Kanada?", @"25 000", @"Tretusen", @"Åttava", @"Inga alls", @"Åttava"];
    self.q3 = @[@"Vilket land har de sämsta hotellen?", @"Filippinerna, där ligger Manil(l)a", @"Danmark", @"Kina", @"Stockholm", @"Filippinerna, där ligger Manil(l)a"];
    self.q4 = @[@"Vad sa göteborgaren till Obi-Wan?", @"My young padowan", @"May the force be with you", @"JeeDaaaj", @"Har du ett lasersvärd i fickan ;)", @"JeeDaaaj"];
    self.q5 = @[@"Vilket land har billigast kött?", @"Köttoslovakien", @"Stockholm", @"Thai-wan", @"Ko-rea", @"Ko-rea"];
    self.q6 = @[@"I vilken stad tar bilköerna aldrig slut?", @"Konstantinopel", @"Stockholm", @"Berlin", @"Alla städer", @"Konstantinopel"];
    self.q7 = @[@"Vilken är den största risken med att åka till Alperna?", @"Risk för lavin", @"Bli ihjälskjuten av ett rådjur", @"De e la vin-faran", @"Frysa skALPEN av sig", @"De e la vin-faran"];
    self.q8 = @[@"Är det kul att jobba som frisör i USA?", @"No, it sax", @"Beror på inkomsten", @"Ja jättekul, en sån här chans får man bara en gång i livet", @"Beror på kunderna", @"No, it sax"];
    self.q9 = @[@"Hur låser man upp drömkåken?", @"Med en husnyckel", @"Med the force", @"Med en Skifsnyckel", @"Med att sjunga Justin Bieber", @"Med en Skifsnyckel"];
    self.round = 1;
    self.score = 0;
    self.wrongAnswer = @"Du svarade fel!";
    self.correctAnswer = @"Du svarade rätt!";
    self.nextQuestion = @"Nästa fråga";
    self.yesBool = [NSNumber numberWithBool:YES];
    self.noBool = [NSNumber numberWithBool:NO];
    self.guessedThisRound = NO;
    self.questionsAvailable = [@[self.yesBool, self.yesBool, self.yesBool, self.yesBool, self.yesBool, self.yesBool, self.yesBool, self.yesBool, self.yesBool, self.yesBool] mutableCopy];
    //placing temps for now...
    self.endOfRound = [@[self.correctAnswer, self.nextQuestion] mutableCopy];
}

-(NSArray*)correspondingQuestion:(int)number{
    if (number == 0) {
        self.currentAnswer = self.q0[5];
        return self.q0;
    } else if (number == 1) {
        self.currentAnswer = self.q1[5];
        return self.q1;
    } else if (number == 2) {
        self.currentAnswer = self.q2[5];
        return self.q2;
    } else if (number == 3) {
        self.currentAnswer = self.q3[5];
        return self.q3;
    } else if (number == 4) {
        self.currentAnswer = self.q4[5];
        return self.q4;
    } else if (number == 5) {
        self.currentAnswer = self.q5[5];
        return self.q5;
    } else if (number == 6) {
        self.currentAnswer = self.q6[5];
        return self.q6;
    } else if (number == 7) {
        self.currentAnswer = self.q7[5];
        return self.q7;
    } else if (number == 8) {
        self.currentAnswer = self.q8[5];
        return self.q8;
    } else {
        self.currentAnswer = self.q9[5];
        return self.q9;
    }
}
@end
