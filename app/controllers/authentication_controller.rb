class AuthenticationController < ApplicationController
    # skip_before_action :authenticate_request
   
    # def authenticate
    #   command = AuthenticateUser.call(params[:username], params[:password])
   
    #   if command.success?
    #     render json: { auth_token: command.result }
    #   else
    #     render json: { error: command.errors }, status: :unauthorized
    #   end
    # end

    def create 
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
          render json: user, methods:[ :token ]
      else
          render json: {
              error: 'username or password are incorrect',
              status: 401
          }
      end
  end
  
  def get_user_from_token
      @user = logged_in_user
      render json: @user, methods:[ :token ]
  end
   end