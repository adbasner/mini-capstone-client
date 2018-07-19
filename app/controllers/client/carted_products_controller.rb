class Client::CartedProductsController < ApplicationController
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
    response = Unirest.post('http://localhost:3000/api/carted_products/', parameters: {
        product_id: params[:input_product_id],
        quantity: params[:input_quantity],
      })

    @carted_products = response.body
    p '*' * 75
    p @carted_products
    p '*' * 75

    flash[:success] = 'You added something to a cart!'

    redirect_to "/client/carted_products/#{@carted_products['id']}"
  end
end
