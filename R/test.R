if ( FALSE ) {

  auth <- ao_auth(client_id = 'zyK0bxgWEYjz34XA6Jed', client_secret = 'SQRO18XZ1aFjF4FZNFMW32gaonN9VPr7K2mX9JiS')
  leaners <- ao_get_leaners()
  course_progress <- ao_get_course_progress(head(leaners, 5))
  course_progress <- ao_get_course_progress(emails = leaners$email[1:4])

}
