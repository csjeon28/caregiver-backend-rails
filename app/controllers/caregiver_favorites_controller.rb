class CaregiverFavoritesController < ApplicationController
    before_action :set_caregiver, only: [:create]

    def create
        if @caregiver
            @caregiver_favorite = CaregiverFavorite.find_by(parent_id: caregiver_favorite_params[:parent_id], caregiver_id: @caregiver.id)
            if @caregiver_favorite
                deletedId = @caregiver_favorite.id
                if @caregiver_favorite.destroy
                    render json: { created: false, removedId: deletedId }
                end
            else
                @caregiver_favorite = CaregiverFavorite.new(caregiver_favorite_params)
                @caregiver_favorite.caregiver_id = @caregiver.id
                if @caregiver_favorite.save
                    render json: { created: true, favorite: @caregiver_favorite.as_json }
                end
            end
        else
            render :json => { msg: "Favoriting error" }, :status => :bad_request
        end
    end

    private

    def caregiver_favorite_params
        params.require(:caregiver_favorite).permit(:parent_id, :caregiver_id)
    end
end
