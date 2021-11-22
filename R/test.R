if ( FALSE ) {

  auth <- ao_auth(client_id = 'zyK0bxgWEYjz34XA6Jed', client_secret = 'SQRO18XZ1aFjF4FZNFMW32gaonN9VPr7K2mX9JiS')
  leaners <- ao_get_leaners()
  part_leaners <- ao_get_leaners_registered_at(date = '2021-10-20', operator = '+')
  course_progress <- ao_get_course_progress(leaners)
  course_progress <- ao_get_course_progress(emails = leaners$email[1:4])
  course_progress <- select(course_progress, -content_progress)
  passive_leaners <- ao_get_passive_leaners()
  course_progress_passive <- ao_get_course_progress(passive_leaners)
  certs <- ao_get_certificates(leaners)

}
