class Client::ProductsController < ApplicationController

  def index
    user_input = params[:search]
    sort_by = params[:sort_by]
    response = Unirest.get('http://localhost:3000/api/products',
      parameters: {
        search: user_input,
        sort_by: sort_by
      })
    @products = response.body
    render 'index.html.erb'
  end

  def show
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product1 = response.body
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    # get params
    # send params to api
    response = Unirest.post('http://localhost:3000/api/products/', parameters: 
      {
        input_name: params[:input_name],
        input_description: params[:input_description],
        input_price: params[:input_price],
        input_image_url: params[:input_image_url]
      })

    @product1 = response.body

    #flash hash
    flash[:success] = "You created a new coffee!"

    # return data
    # render 'show.html.erb'
    redirect_to "/client/products/#{@product1['id']}"
  end

  def edit
    # start same as show
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product1 = response.body
    # then render edit page
    render 'edit.html.erb'
  end

  def update
    # client params
    client_params = {
        input_name: params[:input_name],
        input_description: params[:input_description],
        input_price: params[:input_price],
        input_image_url: params[:input_image_url]
        }
    # reponse
    response = Unirest.patch("localhost:3000/api/products/#{params[:id]}",
    parameters: client_params)

    @product1 = response.body
    # flash hash
    flash[:success] = "You updated the coffee!"

    # show
    # render 'show.html.erb'
    redirect_to "/client/products/#{@product1['id']}"
  end

  def destroy
    response = Unirest.delete("localhost:3000/api/products/#{params[:id]}")
    flash[:danger] = "You deleted the coffee!"


    # render 'destroy.html.erb'
    redirect_to "/client/products/"
  end
end
