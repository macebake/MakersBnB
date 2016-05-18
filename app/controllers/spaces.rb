
class Bnb < Sinatra::Base

  get '/spaces' do
  # @spaces = Space.all
    erb :'spaces/listings'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
     user = session[:user_id]
     space = Space.create(name: params[:name],
     description: params[:description],
     price: params[:price], user_id: session[:user_id])
     space.save
     p space
     redirect '/spaces'
  end

  get '/spaces/:id' do
    @space = Space.get(params[:space_id])
    erb :'spaces/details'
  end
end
