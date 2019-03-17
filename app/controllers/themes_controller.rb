class ThemesController < ApplicationController
    before_action :set_item, only: [:show, :destroy, :update]

    def index
        @items = Theme.all
        json_response(@items)
    end
    
    def show
        json_response(@item)
    end

    def create
        @item = Theme.new(allow_params)
        json_response(@item.save)
    end

    def update
        @item.update allow_params if @item
        json_response(@item)
    end

    def destroy
        @item.destroy if @item
        json_response(@item)
    end


    private

    def allow_params
        params.require(:theme).permit!
    end

    def set_item
        @item = Theme.find(params[:id]) rescue nil
    end
end
