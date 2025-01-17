require "#{Rails.root}/lib/json_web_token"

class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @library_admin = LibraryAdmin.find_by_email(params[:email])
    if @library_admin&.authenticate(params[:password])
      token = JsonWebToken.encode(admin_id: @library_admin.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                      username: @library_admin.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end