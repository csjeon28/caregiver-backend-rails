# require 'dotenv/load'

class ApplicationController < ActionController::API

    private

    def current_parent
        token = request.headers['Auth-Token']
        begin
          parent_id = JWT.decode(token, ENV['SECRET_KEY'])[0]['parent_id']
          return Parent.find_by(id: parent_id)
        rescue
          nil
        end
    end
  
    def current_caregiver
        token = request.headers['Auth-Token']
        begin
          caregiver_id = JWT.decode(token, ENV['SECRET_KEY'])[0]['caregiver_id']
          return Caregiver.find_by(id: caregiver_id)
        rescue
          nil
        end
    end
  
    def authorize_parent
        unless current_parent
          return nil
        end
    end
  
    def authorize_caregiver
        unless current_caregiver
          return nil
        end
    end
    
end

# require 'dotenv/load'

# SECRET_KEY = ENV['SECRET_KEY']

# class ApplicationController < ActionController::API
#     # locks down entire app to only authorized users
#     before_action :authorized

#     # takes in an id and JWT encodes it with the secret key
#     def encode_token(id)
#         JWT.encode({user_id: id}, SECRET_KEY)
#     end
    
#     # gets the authorization header, which will look like { Authorization: 'Bearer <token>' }
#     def auth_header
#         request.headers["Authorization"]
#     end

#     def decode_token
#         # if there is an error in the 2 lines below, return nil instead of an error
#         begin
#             # grabs the token from the authorization header ('Bearer <token>')
#             token = auth_header.split(" ")[1]
#             # decodes the token with the secret key, and grabs the user_id
#             JWT.decode(token, SECRET_KEY)[0]["user_id"]
#         rescue
#             nil
#         end
#     end

#     # finds the user associated with the decoded token
#     def session_user
#         User.find_by(id: decode_token)
#     end

#     # returns a bool based on if we found the user
#     def logged_in?
#         !!session_user
#     end

#     # send back an error to log in unless user is logged in, used to lock down entire app
#     def authorized
#         render json: { errors: 'Please log in' }, status: :unauthorized unless logged_in?
#     end
# end