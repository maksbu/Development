//
//  main.c
//  terminalBox
//
//  Created by Mac on 01.10.13.
//  Copyright (c) 2013 maksburo. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

// Обьявление глобальной переменной
float lastTemperature;


float fahrenheitFromCelsius(float cel)
{
    lastTemperature = cel;
    float fahr = cel * 1.8 + 32.0;
    printf("%f Celsius is %f Fahrenheit\n", cel, fahr);
    return fahr;
}

int main(int argc, const char * argv[])
{

    int i = 17;
    printf("i stores its value at %p\n", &i); printf("this function starts at %p\n", main); return 0;
}

