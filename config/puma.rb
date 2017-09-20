puts "starting puma config"
plugin :heroku

class PumaRollbarTools
  include Rollbar::RequestDataExtractor
end

lowlevel_error_handler do |error, env|
  puts "lowlevel_error_handler is being invoked"
  Rollbar.scope(request: PumaRollbarTools.new.extract_request_data_from_rack(env)).critical(error)
  [ 500, {},
    [ "An error has occurred, and our engineers have been informed. Please reload the page. If you continue to have problems, contact support@example.com\n" ]
  ]
end
puts "ending puma config"
