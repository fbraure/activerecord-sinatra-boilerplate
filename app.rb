require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require 'byebug'

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurant/:id" do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

post "/restaurants" do
  name = params[:name]
  city = params[:city]
  Restaurant.create(name: name, city: city)
  redirect '/'
end
