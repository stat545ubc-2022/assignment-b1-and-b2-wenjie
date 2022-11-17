
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AssignmentB2

<!-- badges: start -->
<!-- badges: end -->

The goal of AssignmentB2 is to wrap that function in an R package. In
this assignment, I wrapped the mean_of_each_group funciton into the R
folder.

## Installation

You can install the development version of assignment-b1-and-b2-haleymac
like so:

``` r
install_github("stat545ubc-2022/assignment-b1-and-b2-wenjie", ref = "0.1.0")
```

Before started, you may need to install the following libraries.

``` r
library("dplyr")
library("testthat")
library("tidyverse")
```

Note to use the package in your current environment call it with no
dashes, like so:

``` r
library(AssignmentB2)
```

## Example

This is a basic example which shows you how to use the wrapped function
and the expected output.

``` r
library(AssignmentB2)
Hotel_Dataset <- data.frame(
  City = c("Vancouver", "Vancouver", "Vancouver", "Ames", "Ames", "Taipei"),
  Location = c("Richmond", "Downtown", "Marine Drive", "Boulvard", "ISU", "Dehui"),
  Vacancy_rooms = c(10, 5, 20, 2, 100, 50),
  Price = c(200, 100, 250, 180, 200, 250)
)

mean_of_each_group(Hotel_Dataset, "City", "Vacancy_rooms")
#> # A tibble: 3 × 2
#>   City      Vacancy_rooms
#>   <chr>             <dbl>
#> 1 Ames               51  
#> 2 Taipei             50  
#> 3 Vancouver          11.7
```
