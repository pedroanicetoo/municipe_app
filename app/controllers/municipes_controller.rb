class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[ show edit update destroy ]

  def index
    @municipes = Municipe.all
  end

  def show
  end

  def new
    @municipe = Municipe.new
  end

  def edit
  end

  def create
    @municipe = MunicipeService::CreateOrUpdate.call(municipe_params, :create)
    redirect_to municipe_url(@municipe), notice: "Municipe was successfully created."
  rescue => e
    render :new, status: :unprocessable_entity
  end

  def update
    @municipe = MunicipeService::CreateOrUpdate.call(municipe_params, :update, @municipe)
    redirect_to municipe_url(@municipe), notice: "Municipe was successfully created."
  rescue => e
    render :new, status: :unprocessable_entity
  end

  def destroy
    @municipe.destroy
    redirect_to municipes_url, notice: "Municipes was successfully destroyed."
  end

  def search
    query = params[:search_municipes].presence && params[:search_municipes][:query]
  
    if query
      @municipes = Municipe.search_published(query)
    end
  end

  private
    def set_municipe
      @municipe = Municipe.find(params[:id])
    end

    def municipe_params
      params.fetch(:municipe, {})
    end
end
