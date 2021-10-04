# class ApplicationController < ActionController::API

#     private

#     def current_parent
#         token = request.headers['Auth-Token']
#         begin
#           parent_id = JWT.decode(token, ENV['SECRET_KEY'])[0]['parent_id']
#           return Parent.find_by(id: parent_id)
#         rescue
#           nil
#         end
#     end
  
#     def current_caregiver
#         token = request.headers['Auth-Token']
#         begin
#           caregiver_id = JWT.decode(token, ENV['SECRET_KEY'])[0]['caregiver_id']
#           return Caregiver.find_by(id: caregiver_id)
#         rescue
#           nil
#         end
#     end
  
#     def authorize_parent
#         unless current_parent
#           return nil
#         end
#     end
  
#     def authorize_caregiver
#         unless current_caregiver
#           return nil
#         end
#     end
    
# end

# require 'dotenv/load'

class ApplicationController < ActionController::API
    # locks down entire app to only authorized users
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, ENV['SECRET_KEY'])
    end
    
    # gets the authorization header, which will look like { Authorization: 'Bearer <token>' }
    def auth_header
        request.headers['Authorization']
    end

    def decode_token
      if auth_header
        token = auth_header.split(' ')[1]
  
        begin
          JWT.decode(token, ENV['SECRET_KEY'], true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end

    # finds the user associated with the decoded token
    def login_user
      if decode_token
        @caregiver_id = decode_token[0]['caregiver_id']
        @parent_id = decode_token[0]['parent_id']
        return @caregiver = Caregiver.find_by(id: @caregiver_id) if @caregiver_id
        return @parent = Parent.find_by(id: @parent_id) if @parent_id
      end
    end
    
    # returns a bool based on if we found the user
    def logged_in?
      !!login_user
    end
    
    # send back an error to log in unless user is logged in
    def authorized
        render json: { errors: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end