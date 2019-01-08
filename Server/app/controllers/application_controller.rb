class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers

  protected

  def cors_preflight_check
    print 'test'
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Content-Type'
      headers['Content-Type'] = 'application/json'
      headers['accept-encoding'] = 'gzip, deflate'
    end
  end
end
