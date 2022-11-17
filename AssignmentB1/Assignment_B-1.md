Assignment B-1
================

``` r
library("dplyr")
library("testthat")
library("tidyverse")
```

## Exercise 1: Make a Function

``` r
#' @title mean_of_each_group function
#'
#' @description 
#' This function can be used to output the mean value of each group
#'
#' @param data is the dataset 
#' @param x is the column that wanted to be grouped
#' @param y is the variable that we need to find the mean value
#' @return the mean value of the grouped variable 
#'
mean_of_each_group <- function(data, x, y) {
  data %>%
      group_by(across(all_of(x))) %>%
      summarise(across(y, mean))
}
```

## Exercise 2: Document your Function

## Exercise 3: Include examples

``` r
Hotel_Dataset <- data.frame(
  City = c("Vancouver", "Vancouver", "Vancouver", "Ames", "Ames", "Taipei"),
  Location = c("Richmond", "Downtown", "Marine Drive", "Boulvard", "ISU", "Dehui"),
  Vacancy_rooms = c(10, 5, 20, 2, 100, 50),
  Price = c(200, 100, 250, 180, 200, 250)
)
```

Try to find the average number of vacancy rooms of the Hotel_Dataset for
each city by passing the dataset, City, and Vacancy_rooms respectively
into my function.

``` r
mean_of_each_group(Hotel_Dataset, "City", "Vacancy_rooms")
```

    ## Note: Using an external vector in selections is ambiguous.
    ## ℹ Use `all_of(y)` instead of `y` to silence this message.
    ## ℹ See <https://tidyselect.r-lib.org/reference/faq-external-vector.html>.
    ## This message is displayed once per session.

    ## # A tibble: 3 × 2
    ##   City      Vacancy_rooms
    ##   <chr>             <dbl>
    ## 1 Ames               51  
    ## 2 Taipei             50  
    ## 3 Vancouver          11.7

Try to find the average price of the Hotel_Dataset for each city by
passing the dataset, City, and Price respectively into my function.

``` r
mean_of_each_group(Hotel_Dataset, "City", "Price")
```

    ## # A tibble: 3 × 2
    ##   City      Price
    ##   <chr>     <dbl>
    ## 1 Ames       190 
    ## 2 Taipei     250 
    ## 3 Vancouver  183.

## Exercise 4: Test the Function

### Test 1:

Try to test whether it works as expected in normal case. And in the
following code, I compare the averaged vacant rooms and their
corresponding cities.

``` r
correct <- as_tibble(data.frame(
  City = c("Ames", "Taipei", "Vancouver"),
  Vacancy_rooms = c(51.00000, 50.00000, 11.66667)
))
result <- as_tibble(data.frame(mean_of_each_group(Hotel_Dataset, "City", "Vacancy_rooms")))

rooms1 <- round(select(correct, Vacancy_rooms), 3)
rooms2 <- round(select(result, Vacancy_rooms), 3)

city1 <- select(correct, City)
city2 <- select(result, City)

test_that("Test 1:", {
  expect_equal(rooms1, rooms2)
  expect_equal(city1, city2)
})
```

    ## Test passed 🌈

### Test 2:

Try to test whether the averaged value are not NA

``` r
output <- mean_of_each_group(Hotel_Dataset, "City", "Vacancy_rooms")
average_vacancy_rooms <- select(result, Vacancy_rooms)

test <- paste(is.na(average_vacancy_rooms),collapse=" ")
expected <- paste(c(FALSE, FALSE, FALSE),collapse=" ")


test_that("Test 2:", {
  expect_equal(test, expected)
})
```

    ## Test passed 🎊

### Test 3:

Expect the output should be a tibble

``` r
res <- mean_of_each_group(Hotel_Dataset, "City", "Vacancy_rooms")
test_that("Test 3:", {
  expect_equal(is_tibble(res), TRUE)
})
```

    ## Test passed 🌈
