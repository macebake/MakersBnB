require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Bnb < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    'Hello Bnb!'
  end

  get '/sign-up' do
    erb :signup
  end

  post '/users' do
    user = User.create(firstname: params[:firstname], lastname: params[:lastname], email: params[:email], password: params[:password])
    if user.save
      redirect '/'
    else
      flash[:notice] = "Must have unique email"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
