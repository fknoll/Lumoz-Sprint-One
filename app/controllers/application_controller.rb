class ApplicationController < ActionController::API
  before_action :authenticate_request
  around_action :set_current_user # , instance_writer: false, instance_reader: false
  attr_reader :current_user

  private

  def set_current_user
    Rails.logger.info '---set_current_user-'
    Rails.logger.info serialized_user
    Current.user = serialized_user
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Current.user = nil
  end

  def serialized_user
    UserSerializer.new(current_user).serializable_hash if current_user
  end

  def authenticate_request
    # Token-based authentication with Ruby on Rails 5 API
    # https://www.pluralsight.com/guides/ruby-ruby-on-rails/token-based-authentication-with-ruby-on-rails-5-api
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
