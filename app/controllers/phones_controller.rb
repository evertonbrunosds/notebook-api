class PhonesController < ApplicationController
    before_action :set_phones

    # GET /phones/1
    def show
        render json: @phones
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_phones
      @phones = Phone.where(contact_id: params[:contact_id])
    end

end
