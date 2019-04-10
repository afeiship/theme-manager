class RestController < ApplicationController
  # common data wrapper:
  include Response
  include ExceptionHandler

  # common filters:
  before_action :set_item, only: [:show, :destroy, :update]

  # models:
  def initialize
    super
    model_name = self.class.name.demodulize.sub("Controller", "").singularize
    @model_klass = model_name.constantize
    @model_symbol = model_name.downcase.to_sym
  end

  # GET /items
  def index
    @items = @model_klass.all
    json_response(@items)
  end

  # GET /items/:id
  def show
    json_response(@item)
  end

  # POST /items
  def create
    @item = @model_klass.create!(allow_params)
    json_response(@item, :created)
  end

  # PUT /items/:id
  def update
    @item.update allow_params if @item
    json_response(@item)
  end

  # DELETE /items/:id
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
