require 'sinatra'
require 'json'

class DashboardApp < Sinatra::Base
  # Dados simulados
  @@statistics_data = {
    users: 1000,
    revenue: 50000,
    orders: 200
  }

  @@settings_data = {
    company_name: "Sua Empresa",
    time_zone: "GMT"
  }

  get '/' do
    erb :index
  end

  get '/statistics' do
    content_type :json
    @@statistics_data.to_json
  end

  get '/settings' do
    erb :settings
  end

  post '/settings' do
    @@settings_data[:company_name] = params[:companyName]
    @@settings_data[:time_zone] = params[:timeZone]
    redirect '/settings'
  end

  configure do
    set :erb, :escape_html => true
  end
end

run DashboardApp.run!
