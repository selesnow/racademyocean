# utils micro function ----------------------------------------------------

oa_make_body<- function(
  action,
  options = NULL,
  value = NULL
) {

  option_name <- str_glue('options[{options}]')

  r_body <- list(
    action  = action
    )

  if ( ! is.null(options) ) {
    r_body$options <- value
    r_body <- set_names(r_body, c('action', option_name))
  }

 return(r_body)

}

oa_request <- function(
  body,
  token
) {

  retry(
    {
      resp <- request(getOption('oa.base_url')) %>%
                req_method("POST") %>%
                req_body_form(body) %>%
                req_headers(Authorization = oa_access_token(token)) %>%
                req_perform()
    },
    until     = ~ resp_status(.) == 200,
    interval  = getOption('oa.interval'),
    max_tries = getOption('oa.max_tries')
  )

  resp <- resp_body_json(resp)

  return(resp)

}

oa_parser <- function(
  response
) {

  res <- tibble(data = response) %>%
         unnest_wider('data')

  return(res)

}

oa_set_class <- function(x, obj_class = NULL) {
  class(x) <- c(obj_class, class(x))
  return(x)
}
