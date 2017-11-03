#' Generate some text
#'
#' Having loaded some valid tracery JSON, generate some fun text from it.
#'
#' @param json some JSON loaded with \code{jsonlite::read_json} or \code{\link{read_tracery}}
#' @return some text
#' @importFrom stringr str_detect str_replace str_extract_all str_replace_all
#' @author David L Miller
#' @export
make_tracery <- function(json){

  # to implement:
  # - .split

  # make a start
  thingo <- json$origin[[1]]

  # what is the tag pattern we need to replace?
  tag_pattern <- "#[a-zA-Z_\\.]+#"

  # while there are still things to replace...
  while(str_detect(thingo, tag_pattern)){

    # grab the tags
    tags <- str_extract_all(thingo, tag_pattern)[[1]]
    tags <- str_replace_all(tags, "#", "")

    # loop through the tags at this point...
    for(this_tag in tags){
      thingo <- str_replace(thingo,
                            paste0("#", this_tag, "#"),
                            tag_fun(this_tag, json))
    }
  }

  return(thingo)
}
