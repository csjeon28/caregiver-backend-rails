class CaregiversController < ApplicationController
  skip_before_action :authorized, only: [:create, :login, :index]
  before_action :authorized, only: [:auto_login]
  before_action :set_caregiver, only: [:show]

  # GET /caregivers
  def index
    @caregivers = Caregiver.all
    render json: @caregivers
  end

  # GET /caregivers/1
  def show
    render json: @caregiver
  end

  # POST /caregivers
  def create
    @caregiver = Caregiver.new(caregiver_params)
    if @caregiver.valid?
      token = encode_token({ caregiver_id: @caregiver.id })
      @caregiver.save
      render json: { caregiver: @caregiver, token: token }
    else
      render json: { error: @caregiver.errors.full_messages }
    end
  end

  def login
    @caregiver = Caregiver.find_by(email: caregiver_params[:email])
    
    if @caregiver&.authenticate(caregiver_params[:password])
      token = encode_token({ caregiver_id: @caregiver.id })
      render json: { caregiver: @caregiver, token: token }
    else
      render json: { error: 'Invalid Username/Password or User Type. Please try again.' }
    end
  end
  
  def auto_login
    token = encode_token({ caregiver_id: @caregiver.id })
    if token 
      render json: { caregiver: @caregiver, token: token }
    else 
      render json: {error: 'Please log in'}
    end
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

  def set_caregiver
    @caregiver = Caregiver.find(params[:id])
  end

  def caregiver_params
    params.require(:caregiver).permit(:first_name, :last_name, :email, :password, :date_of_birth, :bio, :smoker, :city, :state, :language, :hourly_rate, :ability_to_drive, :first_aid_cert, :CPR_cert)
  end

end
