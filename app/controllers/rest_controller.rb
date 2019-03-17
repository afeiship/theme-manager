class RestController < ApplicationController
    before_action :set_item, only: [:show, :destroy, :update]

    def initialize
        super
        model_name = self.class.name.demodulize.sub("Controller", "").singularize
        @model_klass = model_name.constantize
        @model_symbol = model_name.downcase.to_sym
    end

    # GET /options
    def index
        @items = @model_klass.all
        json_response(@items)
    end
    
    # GET /options/:id
    def show
        json_response(@item)
    end

    # POST /options
    def create
        @item = @model_klass.create!(a./bllow_params)
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
        params.require(@model_symbol).permit!
    end

    def set_item
        @item = @model_klass.find(params[:id]) rescue nil
    end
end
