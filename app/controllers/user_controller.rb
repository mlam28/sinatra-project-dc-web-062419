class UserController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set(:views, 'app/views/users')
    set :method_override, true
  
    get '/users' do
        @users = User.all
        erb :index
    end

    get '/users/new' do
        erb :new
    end

    get '/users/add/:id' do
        @user = User.find(params[:id])
        @restaurants = Restaurant.all
        erb :drop_down
    end

    get '/users/:id' do
       @user = User.find(params[:id])
       erb :show
    end

    post '/users' do
    user = User.find_or_create_by(params[:user])
    redirect "/users/#{user.id}"
    end

    post '/users/:id' do
        user = User.find(params[:id])
        restaurant = Restaurant.find(params[:user][:restaurants][0])
        UserRestaurant.find_or_create_by(user: user  , restaurant: restaurant)
        redirect "/users/#{user.id}"
    end
  
  end
  