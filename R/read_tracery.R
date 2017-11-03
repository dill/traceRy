#' Read in tracery files
#'
#' Read in JSON files in the tracery format. For now this just uses \code{jsonlite::read_json} but will have further validation later on.
#'
#' @param file path to a tracery JSON file
#' @return an object you can pass to \code{\link{make_tracery}}
#' @export
#' @author David L Miller
#' @importFrom jsonlite read_json
read_tracery <- function(file){
  # make a json friend
  jason <- jsonlite::read_json(file)

  return(jason)
}
