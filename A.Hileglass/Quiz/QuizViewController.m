//
//  QuizViewController.m
//  Quiz
//
//  Created by maksbu on 29.08.14.
//  Copyright (c) 2014 MAKSBU. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Вызов метода init, реализованного суперклассом
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Создание двух массивов и указывающих на них указателей
        questions = [[NSMutableArray alloc] init];
        answers = [[NSMutableArray alloc] init];
        // Добавление вопросов и ответов в массивы
        [questions addObject:@"What is 7 + 7?"];
        [answers addObject:@"14"];
        [questions addObject:@"What is the capital of Vermont?"];
        [answers addObject:@"Montpelier"];
        [questions addObject:@"From what is cognac made?"];
        [answers addObject:@"Grapes"]; }
    // Возврат адреса нового объекта
    return self; }

- (IBAction)showQuestion:(id)sender
{
    // Переход к следующему вопросу
    _currentQuestionIndex++;
    // Был ли последний вопрос?
    if (_currentQuestionIndex == [questions count]) {
        // Возврат к первому вопросу
        _currentQuestionIndex = 0;
    }
    // Получение строки с индексом в массиве questions
    NSString *question = [questions objectAtIndex:_currentQuestionIndex];
    // Регистрация строки в консоли
    NSLog(@"displaying question: %@", question);
    // Отображение строки в поле question
    [_questionLabel setText:question];
    // Очистка поля answer
    [_answerLabel setText:@"???"]; }

- (IBAction)showAnswer:(id)sender
{
    // Каков ответ на текущий вопрос?
    NSString *answer = [answers objectAtIndex:_currentQuestionIndex];
    // Отображение поля answer
    [_answerLabel setText:answer]; }


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
