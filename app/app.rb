ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative './models/link.rb'
require_relative './models/tag.rb'
require 'pry'
require_relative './models/data_mapper_setup'
require_relative './models/user.rb'
require 'sinatra/flash'


class BookmarksManager < Sinatra::Base

  register Sinatra::Flash
  enable  :sessions
  set :sesssion_secret, 'super secret'

  get '/' do
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'signup_form'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect '/links'
      else
        flash.now[:errors] = @user.errors.full_messages.join(" ")
        erb :'signup_form'
      end
      # binding.pry
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all

    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links/create' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:name].split.each do |name|
        link.tags << Tag.create(name: name)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:a' do
      tag = Tag.first(name: params[:a])
      @links = tag ? tag.links : []
      erb :'links/index'
  end
  #
  # # start the server if ruby file executed directly
  run! if app_file == $0
end
