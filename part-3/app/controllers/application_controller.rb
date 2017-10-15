require 'will_paginate/active_record'

class ApplicationController < Sinatra::Base
  include ApplicationHelper
  include WillPaginate::Sinatra::Helpers

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  before do
    @alert_msg = {}
    logged_in
  end

  get '/' do
    @alert_msg[:success_alert] = "Success test alert ..."
    @alert_msg[:danger_alert] = "Danger test alert ..."

    # !logged_in ? (redirect 'users/login') : redirect_to_home_page

    # # if !logged_in
    # #   redirect 'users/login'
    # # else
    #   @channels = Channel.all.order("updated_at DESC").paginate(page: params[:page], per_page: 10)
    #   redirect_to_home_page
    # # end

  end

  def redirect_to_bids
    redirect to '/bids'
  end

  def redirect_to_items
    redirect to '/items'
  end



end

