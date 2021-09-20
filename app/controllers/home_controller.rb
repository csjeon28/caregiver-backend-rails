class HomeController < ApplicationController
    before_action :authorize_parent
    before_action :authorize_caregiver

    def show
        if current_parent
            parent = current_parent
            render json: {
                user: parent.as_json,
                jobs: parent.jobs.as_json,
                caregivers: Caregiver.all.as_json
            }
        elsif current_caregiver
            caregiver = current_caregiver
            render json: {  
                user: caregiver.as_json,
                jobs: caregiver.jobs.as_json,
                parents: Parent.all.as_json
            }
        end
    end
end