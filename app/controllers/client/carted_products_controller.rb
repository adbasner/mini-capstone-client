class Client::CartedProductsController < ApplicationController
  def index
    response = Unirest.get('http://localhost:3000/api/carted_products')
    @carted_products = response.body
    render 'index.html.erb'
  end

  def show
    carted_products_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/carted_products/#{carted_products_id}")
    @carted_products = response.body
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
      product_id: params[:input_product_id],
      quantity: params[:input_quantity] 
    }

    response = Unirest.post('http://localhost:3000/api/carted_products/', parameters: client_params)

    @carted_products = response.body

    flash[:success] = 'You added something to a cart!'

    redirect_to "/client/carted_products/"
  end
end
