class WelcomeController < ApplicationController
    before_action :authorized

    def index
      @jobs = Job.all
      render json: @jobs
    end
end