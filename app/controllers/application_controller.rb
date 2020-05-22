class ApplicationController < ActionController::API
  # before_action :authenticate_request
  # attr_reader :current_user

  # private

  # def authenticate_request
  #   @current_user = AuthorizeApiRequest.call(request.headers).result
  #   render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  # end

  


def check_authentication
  if !logged_in_user
      render json: { error: 'Please log in' }, status: 401
  end
end

def logged_in_user
  #  split_token = request.headers['Authorization'].split(' ')
  # method = split_token[0]
  # token = split_token[1]
  # \/ Same as above
  if request.headers['Authorization']
      method, token = request.headers['Authorization'].split(' ') 
      begin
          payload, headers = JWT.decode(token, ENV['my_apps_secret'])
          current_user = User.find(payload['user_id'])
      rescue JWT::DecodeError
          nil
      end
  end
end
end
