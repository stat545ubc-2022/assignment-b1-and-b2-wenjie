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
#' @export
#'
#' @examples
#'
#' Hotel_Dataset <- data.frame(
#'City = c("Vancouver", "Vancouver", "Vancouver", "Ames", "Ames", "Taipei"),
#'Location = c("Richmond", "Downtown", "Marine Drive", "Boulvard", "ISU", "Dehui"),
#'Vacancy_rooms = c(10, 5, 20, 2, 100, 50),
#'Price = c(200, 100, 250, 180, 200, 250)
#')
#'
#'
mean_of_each_group <- function(data, x, y) {
  data %>%
    group_by(across(all_of(x))) %>%
    summarise(across(y, mean))
}
