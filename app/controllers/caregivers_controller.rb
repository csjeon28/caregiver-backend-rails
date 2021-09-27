# class CaregiversController < ApplicationController
#     before_action :authorize_caregiver, only: [:update]
#     # before_action :find_caregiver, only: [:update]

#   def create
#     caregiver = Caregiver.create(caregiver_params)
#     if caregiver.persisted?
#       token = JWT.encode({ caregiver_id: caregiver.id }, ENV['SECRET_KEY'])
#     #   render json: { caregiver: CaregiverSerializer.new(caregiver), token: token }, status: :created
#       render json: { token: token }, status: :created
#     else
#       render json: {errors: caregiver.errors.full_messages }, status: :not_acceptable
#     end
#   end

#   def update
#     if caregiver.update(caregiver_params)
#       render json: caregiver, status: :accepted
#     else
#       render json: { errors: "Caregiver profile update failed." }, status: :bad_request
#     end
#   end

#   private

#   def caregiver_params
#     params.require(:caregiver).permit(:first_name, :last_name, :email, :password, 
#     :date_of_birth, :bio, :smoker, :city, :state, :country, :language, :hourly_rate, 
#     :ability_to_drive, :first_aid_cert, :CPR_cert, :profile_image)
#   end

#   # def find_caregiver
#   #   caregiver = Caregiver.find_by(id: params[:id])
#   # end
# end


class CaregiversController < ApplicationController
  before_action :authorized, only: [:auto_login, :update, :destroy]
  before_action :set_caregiver, only: [:show, :update, :destroy]

  # GET /caregivers
  def index
    @caregivers = Caregiver.all
    render json: @caregivers
  end

  # GET /caregivers/:id
  def show
    render json: @caregiver
  end

  # POST /caregivers
  def create
    @caregiver = Caregiver.create(caregiver_params)

    if @caregiver.valid?
      token = encode_token({ caregiver_id: @caregiver.id })
      render json: { caregiver: @caregiver, token: token }
    else
      render json: { error: 'Email already registered' }
    end
  end

  def login
    @caregiver = Caregiver.find_by(email: caregiver_params[:email])

    if @caregiver&.authenticate(caregiver_params[:password])
      token = encode_token({ caregiver_id: @caregiver.id })
      render json: { caregiver: @caregiver, token: token }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def auto_login
    token = encode_token({ caregiver_id: @caregiver.id })
    render json: { caregiver: @caregiver, token: token }
  end

  # PATCH/PUT /caregivers/:id
  def update
    if @caregiver.update(caregiver_params)
      render json: @caregiver
    else
      render json: @caregiver.errors, status: :unprocessable_entity
    end
  end

  # DELETE /caregivers/:id
  def destroy
    @caregiver.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_caregiver
    @caregiver = Caregiver.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def caregiver_params
    params.require(:caregiver).permit(:first_name, :last_name, :email, :password, :date_of_birth, :bio, :smoker, :city, :state, :country, :language, :hourly_rate, :ability_to_drive, :first_aid_cert, :CPR_cert, :profile_image)
  end

end
