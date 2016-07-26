ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :navigation
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links/add' do
    Link.create(title: params[:title], url: params[:url], tag: params[:tag])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
