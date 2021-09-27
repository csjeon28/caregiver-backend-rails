class SchedulesController < ApplicationController
    before_action :authorized, only: [:create, :update, :destroy]
    before_action :set_schedule, only: [:show, :update, :destroy]
    before_action :set_parent, only: [:index, :create]
  
    # GET /schedules
    def index
      @schedules = @parent.schedules
      render json: @schedules
    end
  
    # GET /schedules/1
    def show
      render json: @schedule
    end
  
    # POST /schedules
    def create
      start_date = Time.parse(schedule_params[:start_date]).to_i
      end_date = Time.parse(schedule_params[:end_date]).to_i
  
      @time_slots = (start_date..end_date).step(86_400).each do |date|
          slot_date = Time.at(date).strftime('%D')
          @parent.schedules.create(date: slot_date)
        end
      end
  
      if @time_slots
        render json: { status: 'SUCCESS', message: 'Successfully posted' }
      else
        render json: @schedule.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /schedules/1
    def update
      if @schedule.update(schedule_params)
        render json: @schedule
      else
        render json: @schedule.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /schedules/1
    def destroy
      @schedule.destroy
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end
  
    def set_parent
      @parent = Parent.find(params[:parent_id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def schedule_params
      params.require(:schedule).permit(:start_date, :end_date, :parent_id)
    end
end
