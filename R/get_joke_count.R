#' Get number of available jokes in ICNDB
#'
#' @description Get number of available jokes in ICNDB
#' @return A single integer of available jokes in ICNDB
#' @examples get_joke_count()
#' @import httr dplyr jsonlite stringr
#' @export

get_joke_count <- function(){

  joke_count_response <- GET("http://api.icndb.com/jokes/count")

  if(joke_count_response$status_code == 200){

  joke_count <- joke_count_response %>%
    httr::content(as = "text", encoding = "UTF-8") %>%
    fromJSON()

  return(joke_count$value)

  } else {

    message("Joke count unavailable..")

  }
}
