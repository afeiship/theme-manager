class OptionsController < ApplicationController
    before_action :set_item, only: [:show, :destroy, :update]

    # GET /options
    def index
        @items = Option.all
        json_response(@items)
    end
    
    # GET /options/:id
    def show
        json_response(@item)
    end

    # POST /options
    def create
        @item = Option.create!(allow_params)
        json_response(@item, :created)
    end

    # PUT /options/:id
    def update
        @item.update allow_params if @item
        json_response(@item)
    end

    # DELETE /options/:id
    def destroy
        @item.destroy if @item
        json_response(@item)
    end


    private
    def allow_params
        # whitelist params
        params.require(:option).permit!
    end

    def set_item
        @item = Option.find(params[:id]) rescue nil
    end
end
