#' Returns a probability distribution over the political alignment of the speaker
#'
#' Given input text, returns a probability distribution over the political
#' alignment of the speaker.
#' @param text text for analysis
#' @param api_key your personal indico API key
#' @param cloud subdomain for indico private cloud
#' @param version for api version
#' @param ... additional arguments to passed to request
#' @return List with party probability pairs
#' @keywords indico.io machine learning API political sentiment analysis
#' @seealso \code{\link{sentiment}}, \code{\link{language}}
#' @export
#' @import httr rjson stringr
#' @examples
#' affilation <- political("I am so proud to stand here today
#'                          as Prime Minister of four nations
#'                          in one United Kingdom.")
#' affilation
#' most.like <- names(affilation[which.max(unlist(affilation))])
#' least.like <- names(affilation[which.min(unlist(affilation))])
#' cat(sprintf("This text is most like %s and least like %s",
#'             most.like, least.like))
#'
political <- function(text, version = NULL, ...) {

  # Checks parameters
  if (missing(text) || str_trim(text) == "") {
    stop("No text for analysis provided!")
  }

  make_request(text, 'political', version, ...)
}

#'@export
batch_political <- function(text, ...) {
    warning("The `batch_political` function will be deprecated in the next major upgrade. " +
      "Please call `political` instead with the same arguments")
    political(text, ...)
}
