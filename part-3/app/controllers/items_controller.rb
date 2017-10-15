class ItemsController < ApplicationController

  # before "/items/*" do
  #   if !request.post?
  #     if !logged_in
  #       @alert_msg[:danger_alert] = "Please login to choose new items."
  #       erb :'users/login'
  #     end
  #   end
  # end

  # INDEX: items view all.
  get '/items' do
    @items = Item.order('updated_at ASC').limit(10)
    # @items = Item.all.order('updated_at DESC').paginate(page: params[:page], per_page: 5)
    erb :'items/index'
  end

  # NEW: items new
  get '/items/new' do

    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new Item."
      erb :'users/login'
    else
      @item = Item.new  ## Prevents errors on Form Partial.
      erb :'items/new'
    end

  end


  # CREATE:
  post '/items' do
    @item = Item.create(params[:item])
    redirect '/items'
  end

  # SHOW: displays a single item detail page.
  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :'items/show'
  end

  # EDIT:
  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_item
    @item = Item.find(params[:id])
    @item.update(params[:item])
    redirect "/items/#{@item.id}"
  end

  # UPDATE: patch
  patch '/items/:id' do
    update_item
  end

  # UPDATE: put
  put '/items/:id' do
    update_item
  end

  #################################

  # DELETE:
  delete '/items/:id' do
    Item.find(params[:id]).destroy!
    redirect '/items'
  end

end

