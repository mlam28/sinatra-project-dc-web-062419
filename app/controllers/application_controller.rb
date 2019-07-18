class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set(:views, 'app/views')
  set :method_override, true

  get '/' do
    erb :home
  end

end

