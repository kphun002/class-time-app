# class-time-app
Class Time is an application for students to report and check the time/effort specific classes take.  

## Overview

This application allows students to report how many hours or how much effort they had to dedicate to classes in past semesters. Then, other students can use those estimates to plan their schedule for the next semester. By offering estimates of effort per class, this website allows students to calculate how many and which specific classes they should take depending on their available time for the next semester. If the available time is flexible and the students already have specific classes in mind that they want to take, then, they can use the website to estimate how many hours they will need to dedicate to each class to the school in general during that semester.

## Roles
- Student reporting a class (A)
- Student using that report (B)

## Release 1 / ShellHacks Target
- Epic 1: Student A can enter estimates for classes taken in the past.
    - [ ] Story #1: Create "Welcome" screen with
            - welcome message
            - button to rate a class
            - button to check a class
    - [ ] Story #2: Create "Rate Class" screen with:
            - space to enter course code
            - spce to enter number of hours per week
            - button to submit
- Epic 2: Student B can use estimates to enter the name of classes and get the estimated time they require.
     - [ ] Story #3: Create "Check Class" screen with
            - space to enter course code
            - label to show number of hours per week
- Epic 3: Student B can add classes and estimates to a cart and then see the cart and the total amount of hours.
     - [ ] Story #4: Modify "Check Class" screen by
            - adding "Add To Cart" button
            - adding "See Cart" button
     - [ ] Story #5: Create "Cart" screen with
            - scrollable list of classes and their hours
            - button to remove class next to each class
            - label to show total number of hours

## Assumptions that need to be validated
-	Students like having an idea of how much effort they will need to put in a class before enrolling it.
-	Students are willing to take the time to report classes taken in the past
-	Students are willing to trust the estimates offered by other students


