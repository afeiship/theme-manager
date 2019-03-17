class OptionsController < ApplicationController
    before_action :set_item, only: [:show, :destroy, :update]

    def index
        @items = Option.all
        json_response(@items)
    end
    
    def show
        json_response(@item)
    end

    def create
        @item = Option.new(allow_params)
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
        params.require(:option).permit!
    end

    def set_item
        @item = Option.find(params[:id]) rescue nil
    end
end
