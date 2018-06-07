#' Get all available joke categories from ICNDB
#'
#' @description Get all available joke categories from ICNDB
#' @return A vector of available joke categories
#' @examples get_joke_categories()
#' @export

get_joke_categories <- function(){

  categories_reponse <- httr::GET("http://api.icndb.com/categories")

  if(categories_reponse$status_code == 200){

  categories_unpacked <- categories_reponse %>%
    httr::content(as = "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON()

  return(categories_unpacked$value)

  } else{

    message("ICNDB joke categories unavailable..")

  }
}
