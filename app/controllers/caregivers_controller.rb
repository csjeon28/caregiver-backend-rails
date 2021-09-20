class CaregiversController < ApplicationController
    before_action :authorize_caregiver, only: [:update]
    before_action :find_caregiver, only: [:update]

  def create
    caregiver = Caregiver.create(caregiver_params)
    if caregiver.persisted?
      token = JWT.encode({ caregiver_id: caregiver.id }, ENV['SECRET_KEY'])
    #   render json: { caregiver: CaregiverSerializer.new(caregiver), token: token }, status: :created
      render json: { token: token }, status: :created
    else
      render json: {errors: caregiver.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    if caregiver.update(caregiver_params)
      render json: caregiver, status: :accepted
    else
      render json: { errors: "Caregiver profile update failed." }, status: :bad_request
    end
  end

  private

  def caregiver_params
    params.require(:caregiver).permit(:first_name, :last_name, :email, :password, 
    :date_of_birth, :bio, :smoker, :city, :state, :country, :language, :hourly_rate, 
    :ability_to_drive, :first_aid_cert, :CPR_cert, :profile_image)
  end

  def find_caregiver
    caregiver = Caregiver.find_by(id: params[:id])
  end
end
