# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/tests.html
# * https://testthat.r-lib.org/reference/test_package.html#special-files


library(dplyr)
library(tidyverse)
library(testthat)
library(AssignmentB2)


correct <- as_tibble(data.frame(
  City = c("Ames", "Taipei", "Vancouver"),
  Vacancy_rooms = c(51.00000, 50.00000, 11.66667)
))

Hotel_Dataset <- data.frame(
  City = c("Vancouver", "Vancouver", "Vancouver", "Ames", "Ames", "Taipei"),
  Location = c("Richmond", "Downtown", "Marine Drive", "Boulvard", "ISU", "Dehui"),
  Vacancy_rooms = c(10, 5, 20, 2, 100, 50),
  Price = c(200, 100, 250, 180, 200, 250)
)

result <- as_tibble(data.frame(mean_of_each_group(Hotel_Dataset, "City", "Vacancy_rooms")))

rooms1 <- round(select(correct, Vacancy_rooms), 3)
rooms2 <- round(select(result, Vacancy_rooms), 3)

city1 <- select(correct, City)
city2 <- select(result, City)

test_that("Test 1:", {
  expect_equal(rooms1, rooms2)
  expect_equal(city1, city2)
})
