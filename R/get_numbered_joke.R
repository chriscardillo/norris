#' Get a specific joke by number
#'
#' @description Get a specific joke by number
#' @param joke_number A single integer
#' @return A single joke
#' @examples get_numbered_joke(17)
#' @export

get_numbered_joke <- function(joke_number){

  if(class(joke_number) != "numeric" || length(joke_number) != 1){

    message("Improper joke number format. Please read documentation and try again.")

  } else {

  joke_number_rounded <- round(joke_number)

  joke_response <- httr::GET(stringr::str_c("http://api.icndb.com/jokes/", joke_number_rounded, "?escape=javascript"))

  joke <- joke_response %>%
     httr::content(as = "text", encoding = "UTF-8") %>%
     jsonlite::fromJSON()

  if(joke$type == "success"){

  return(joke$value$joke)

   } else {

    max_joke_number <- get_joke_count()

    message(stringr::str_c("Joke number unavailable. Please pick a valid joke number - ", max_joke_number, " or less"))

    }

  }

}
