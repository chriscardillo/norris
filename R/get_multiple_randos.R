#' Get a bunch of random Chuck Norris jokes.
#'
#' @description Get a bunch of random Chuck Norris jokes.
#' @param jokes The number of jokes to fetch.
#' @return A tibble of jokes
#' @examples get_multiple_randos(10)
#' @import httr dplyr jsonlite stringr
#' @export

get_multiple_randos <- function(jokes = 5){

  if(class(jokes) != "numeric"){

    message("Please use an integer to specify joke count.")

  } else{

    jokes_round <- round(jokes)

    random_joke_response <- httr::GET(stringr::str_c("http://api.icndb.com/jokes/random/", jokes_round, "?escape=javascript"))

    if(random_joke_response$status_code == 200){

      random_joke <- random_joke_response %>%
        httr::content(as = "text", encoding = "UTF-8") %>%
        fromJSON()

      return(random_joke$value %>% dplyr::select(-categories) %>% dplyr::as_tibble())

    } else {

      message("Multiple randos unavailable..")

    }
  }
}
