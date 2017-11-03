# this function decides what to do with tags
# also handles the modifiers like .s .a .capitalise
#' @importFrom stringr str_split str_detect str_extract
tag_fun <- function(x, jason){
  if(str_detect(x, "\\.")){

    x <- str_split(x, "\\.")[[1]]
    this_tag <- x[1]
    x <- x[-1]

    res <- jason[[this_tag]][[sample(length(jason[[this_tag]]), 1)]]

    if(!str_detect(res, "#.+#")){
      ## modifiers
      # plural
      if("s" %in% x){
        res <- paste0(res, "s")
      }
      # capitals
      if("capitalize" %in% x){
        res <- toupper(res)
      }
      # item
      if("a" %in% x){
        if(str_extract(x[1], "^[aeiouAEIOU]")){
          res <- paste0("an ", res)
        }else{
          res <- paste0("a ", res)
        }
      }
    }
    return(res)
  }else{
    return(jason[[x]][[sample(length(jason[[x]]), 1)]])
  }
}
