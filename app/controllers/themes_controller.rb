class ThemesController < ApplicationController
    before_action :set_item, only: [:show, :destroy, :update]

    # GET /themes
    def index
        @items = Theme.all
        json_response(@items)
    end
    
    # GET /themes/:id
    def show
        json_response(@item)
    end

    # POST /themes
    def create
        @item = Theme.create!(allow_params)
        json_response(@item, :created)
    end

    # PUT /themes/:id
    def update
        @item.update allow_params if @item
        json_response(@item)
    end

    # DELETE /themes/:id
    def destroy
        @item.destroy if @item
        json_response(@item)
    end


    private
    def allow_params
        # whitelist params
        params.require(:theme).permit!
    end

    def set_item
        @item = Theme.find(params[:id]) rescue nil
    end
end
