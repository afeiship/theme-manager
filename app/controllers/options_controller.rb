class OptionsController < ApplicationController
    def index
        @items = Option.all
        json_response(@items)
        # render json: @items, status: :ok
    end
    
    def create
        @item = Option.new(allow_params)
        @item.save
    end

    private 
    def allow_params
        params.require(:option).permit!
    end
end
