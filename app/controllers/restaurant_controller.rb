class RestaurantController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set(:views, 'app/views/restaurants')
    set :method_override, true
  
    get '/restaurants' do
        @restaurants = Restaurant.all
        erb :index
    end

    get '/restaurants/new' do
        erb :new
    end

    get '/restaurants/:id' do
       @restaurant = Restaurant.find(params[:id])
       erb :show
    end

    post '/restaurants' do
        restaurant = Restaurant.find_or_create_by(params[:restaurant])
        redirect "/restaurants/#{restaurant.id}"
    end

    post '/restaurants/:id' do
        restaurant = Restaurant.find(params[:id])
        user = params[:user].map do |key, value|
            user = User.find_by(name: value)
        end
        new = UserRestaurant.find_or_create_by(user: user[0], restaurant: restaurant)
        redirect "./users/#{user[0].id}"
    end
    
  
  end
  