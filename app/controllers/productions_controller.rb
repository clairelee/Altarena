class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :edit, :update, :destroy]

  # GET /productions
  # GET /productions.json
  def index
    @productions = Production.all
  end

  # GET /productions/1
  # GET /productions/1.json
  def show
  end

  # GET /productions/new
  def new
    @production = Production.new
  end

  # GET /productions/1/edit
  def edit
  end

  # POST /productions
  # POST /productions.json
  def create
    @production = Production.new(production_params)
    
    if @production.save
        redirect_to notes_home_path, notice: "#{@production.name} was successfully created."
    else
        render :new 
    end
  end

  # PATCH/PUT /productions/1
  # PATCH/PUT /productions/1.json
  def update
    
  end

  # DELETE /productions/1
  # DELETE /productions/1.json
  def destroy
    @production.destroy
    redirect_to productions_url, notice: 'Production was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production
      @production = Production.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_params
      params.require(:production).permit(:name, :company, :opening_date)
    end
end
