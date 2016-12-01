ENV['RACK_ENV']||='development'
require 'sinatra/base'
require './models/link.rb'
require './models/tag.rb'
require_relative './models/database_setting.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
    redirect '/links/new'
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    @link_tag = LinkTag.all
    erb :"links/index"
  end

  get '/links/new' do
    erb :"links/new"
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.create(tag_name: params[:tag])
    LinkTag.create( :link => link, :tag => tag )
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
