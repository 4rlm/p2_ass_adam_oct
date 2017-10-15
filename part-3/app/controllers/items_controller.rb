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

###### CUSTOMIZING BELOW #####

  # CREATE:
  post '/items' do
    params[:item][:user_id] = @user.id
    @item = Item.find_or_create_by(params[:item])
    @alert_msg[:success_alert] = "Auction Item Has Been Added."
    # erb :'items/user_items'
    redirect 'items/user_items'
  end

  get '/items/user_items' do
    if !logged_in
      @alert_msg[:danger_alert] = "Please login to view your items."
      erb :'users/login'
    else
      @user_items = Item.where(user_id: @user.id)
      erb :'items/user_items'
    end
  end

  get '/items/:id/item_bid_form' do
    if !logged_in
      @alert_msg[:danger_alert] = "Please login to place a bid."
      erb :'users/login'
    else
      @item = Item.find(params[:id])
      erb :'items/item_bid_form'
    end
  end

  post '/items/:id/item_bid_form' do
    Bid.find_or_create_by(amount: params[:bid][:amount], user_id: @user.id, item_id: params[:id])
    @alert_msg[:success_alert] = "Your bid has been submitted."

    redirect '/bids'
  end


  ###### CUSTOMIZING ABOVE #####


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
    @alert_msg[:success_alert] = "Item Successfully Deleted."
    erb :'items/user_items'
  end

end
