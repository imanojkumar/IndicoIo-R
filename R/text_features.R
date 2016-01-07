#' Transforms text inputs into numerical features
#'
#' @inheritParams political
#' @return List with image features
#' @keywords indico.io machine learning API image features recognition
#' @seealso \code{\link{image_features}}, \code{\link{relevance}}
#' @export
#' @import httr rjson stringr
#' @examples
#' features <- text_features(text)
#'
#' length(features) # 300
#'
#'@export
text_features <- function(text,  api_key = FALSE, cloud = FALSE, version = NULL, ...) {

  # Checks parameters
  if (missing(text) || str_trim(text) == "") {
    stop("No text for analysis provided!")
  }

  make_request(text, 'text_features', api_key, cloud, version, persona = TRUE, ...)
}