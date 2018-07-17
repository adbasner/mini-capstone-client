class Client::OrdersController < ApplicationController
  def show
    order_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/orders/#{order_id}")
    @order = response.body
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    response = Unirest.post('http://localhost:3000/api/orders/', parameters: {
        input_product_id: params[:input_product_id],
        input_quantity: params[:input_quantity],
      })

    @order = response.body

    flash[:success] = 'You ordered a coffee!'

    redirect_to "/client/orders/#{@order['id']}"
  end
end
