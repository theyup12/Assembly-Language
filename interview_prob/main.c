#include <stdio.h>
#include <stdint.h>
#include <string.h>
double interview(char name_[], double salary_);
int main(){
    double salary;
    char name[50];
    double new_salary = -999;
    printf("Weclome to Software Analysis by Paramount Programmers, Inc.\n");
    printf("Please enter your first and last name and press enter: ");
    fgets(name,sizeof(name), stdin);
    name[strcspn(name, "\n")] = 0;
    printf("\nThank you, %s. Our records show that you applied for employment here\n", name);
    printf("With our agency a week ago.\n");
    printf("Please enter your expected annual salary when employed at Paramount: ");
    scanf("%lf", &salary);
    printf("\nYour interview with Ms Linda Fenster, Personnel Manager, will begin shortly.\n");
     new_salary= interview(name, salary);
    if(new_salary < 50000){
        printf("\nHello, %s I am the receptinist\n", name);
        printf("We have an opening for you in the company cafeteria for $%.2lf annually.\n", new_salary);
        printf("Take your time to let us know your decision.\nBye.\n");

    }else if(new_salary < 200000){
        printf("\nHello, %s I am the receptinist\n", name);
        printf("This envelope has your job offer with starting slaray $%.2lf.\n", new_salary);
        printf("Please check back on Monday morning at 8 am.\nBye.\n");

    }else{
        printf("\nHello, Mr Sawyer. I am the receptinist\n");
        printf("This envelope has your job offer with starting slaray $%.2lf.\n", new_salary);
        printf("the middle time out CTO wishes to have dinner with you.\n");
        printf("Have very nice evening Mr Sawyer.\n");
    }
    return 0;
}