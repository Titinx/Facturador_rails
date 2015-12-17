class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client_invoices = @client.invoices
    client_age
    client_invoicing_per_year
    client_cant_invoices_per_month
    client_top_five_person
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :surname, :birthday, :gender, :kind_document, :document, :cuil_cuit)
    end

    # requisitos pedidos en el tpi
    # se es consiente de que se recorre 3 veces la colleccion "@client_invoices" pero
    # resulta mas comodo para analizar las 3 operaciones pedidas
    def client_age
      @age = ((Date.current - @client.birthday)/365).to_i
    end

    def client_invoicing_per_year
      #El monto total facturado por año para el cliente (al estilo "En 2015 facturó $ 999.999,00").
      @invoicing_year = Hash.new(0)
      @client.invoices.each do | inv |
        @invoicing_year[inv.date.year] += inv.amount
      end
        @invoicing_year = @invoicing_year.sort_by { |k,v| k } 
    end

    def client_cant_invoices_per_month
      #La cantidad de facturas que el cliente ha emitido por mes desde Enero del corriente año.
      @cant_invoices = Hash.new(0)
      @client_invoices.each do | inv |
        @cant_invoices[inv.date.month] += 1 if Date.today.year == inv.date.year
      end
      @cant_invoices.sort_by { | key, value | key }.map do |key, value|
        key, value = Date::MONTHNAMES[key], value
      end
    end

    def client_top_five_person
      #Las 5 personas a las que más les ha facturado ese cliente.
      @cant_person = Hash.new(0)
      @client_invoices.each do | inv |
        @cant_person[inv.person] += 1
      end
      @cant_person.sort_by { |key ,value| -value }.first 5
    end

end
