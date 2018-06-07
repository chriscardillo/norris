#' Get a random Chuck Norris joke
#'
#' @description Get a random Chuck Norris joke
#' @return A single joke
#' @examples get_random_joke()
#' @import httr dplyr jsonlite stringr
#' @export

get_random_joke <- function(){

  random_joke_response <- httr::GET(stringr::str_c("http://api.icndb.com/jokes/random", "?escape=javascript"))

  if(random_joke_response$status_code == 200){

  random_joke <- random_joke_response %>%
    httr::content(as = "text", encoding = "UTF-8") %>%
    fromJSON()

  return(random_joke$value$joke)

  } else {

    message("Random joke unavailable..")

  }

}
