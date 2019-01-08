class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  before_action :cors_preflight_check

  protected

  def cors_preflight_check
    print 'test'
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
    end
  end
end
