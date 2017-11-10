class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy, :sobre]

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    # Foi adicionado
    redirect_to root_path
  end

  # GET /countries/new
  def new
    redirect_to root_path
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
    # Foi adicionado
    redirect_to root_path
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sobre
  end

  def listaContinentes
    @countries = Country.all

    @valor = params[:escolha]
    if @valor.nil?
      @paises = Country.all.paginate(:page => params[:page], :per_page => 20)
      #flash[:warning] = "SEM EXCEÇÃO!"
    elsif @valor == 'america_do_sul'
      @paises = @countries.paginate(:page => params[:page], :per_page => 10).where("local = 'América do Sul'")
      flash[:warning] = "América do Sul!"
    elsif @valor == 'america_central'
      @paises = @countries.paginate(:page => params[:page], :per_page => 10).where("local = 'América Central'")
      flash[:warning] = "América Central!"
    elsif @valor == 'america_do_norte'
      @paises = @countries.paginate(:page => params[:page], :per_page => 10).where("local = 'América do Norte'")
      flash[:warning] = "América do Norte!"
    elsif @valor == 'europa'
      @paises = @countries.paginate(:page => params[:page], :per_page => 10).where("local = 'Europa'")
      flash[:warning] = "Europa!"
    elsif @valor == 'africa'
      @paises = @countries.paginate(:page => params[:page], :per_page => 10).where("local = 'África'")
      flash[:warning] = "África!"
    elsif @valor == 'asia'
      @paises = @countries.paginate(:page => params[:page], :per_page => 10).where("local = 'Ásia'")
      flash[:warning] = "Ásia!"
    elsif @valor == 'oceania'
      @paises = @countries.paginate(:page => params[:page], :per_page => 10).where("local = 'Oceania'")
      flash[:warning] = "Oceania!"
    else
      @paises = Country.all.paginate(:page => params[:page], :per_page => 20)
      #flash[:warning] = "FAIL!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(
        :nome, 
        :local, 
        :capital, 
        :extensao, 
        :idioma, 
        :populacao, 
        :pib, 
        :moeda, 
        :ano_referencia, 
        :imagem,
        :escolha
      )
    end
end
