class BidsController < ApplicationController

  # before "/bids/*" do
  #   if !request.post?
  #     if !logged_in
  #       @alert_msg[:danger_alert] = "Please login to choose new bids."
  #       erb :'users/login'
  #     end
  #   end
  # end

  # INDEX: bids view all.
  get '/bids' do
    @bids = Bid.order('updated_at ASC').limit(10)
    # @bids = Bid.all.order('updated_at DESC').paginate(page: params[:page], per_page: 5)
    erb :'bids/index'
  end

  # NEW: bids new
  get '/bids/new' do

    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new Bid."
      erb :'users/login'
    else
      @bid = Bid.new  ## Prevents errors on Form Partial.
      erb :'bids/new'
    end

  end


  # CREATE:
  post '/bids' do
    @bid = Bid.create(params[:bid])
    redirect '/bids'
  end

  # SHOW: displays a single bid detail page.
  get '/bids/:id' do
    @bid = Bid.find(params[:id])
    erb :'bids/show'
  end

  # EDIT:
  get '/bids/:id/edit' do
    @bid = Bid.find(params[:id])
    erb :'bids/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_bid
    @bid = Bid.find(params[:id])
    @bid.update(params[:bid])
    redirect "/bids/#{@bid.id}"
  end

  # UPDATE: patch
  patch '/bids/:id' do
    update_bid
  end

  # UPDATE: put
  put '/bids/:id' do
    update_bid
  end

  #################################

  # DELETE:
  delete '/bids/:id' do
    Bid.find(params[:id]).destroy!
    redirect '/bids'
  end

end

