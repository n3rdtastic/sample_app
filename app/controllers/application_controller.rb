class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper # make SessionsHelper module available in controllers
end
