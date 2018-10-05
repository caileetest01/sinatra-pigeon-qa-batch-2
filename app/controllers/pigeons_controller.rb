class PigeonsController < ApplicationController

  get '/pigeons' do
    @pigeons = Pigeon.all
    erb :"pigeons/index"
  end

  get '/pigeons/new' do
    erb :"pigeons/new"
  end

  get '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    erb :"pigeons/show"
  end

  get '/pigeons/:id/edit' do
    @pigeon = Pigeon.find(params[:id])
    erb :"pigeons/edit"
  end

  post '/pigeons' do
    @pigeon = Pigeon.new(params)
    @pigeon.name = params["name"]
    @pigeon.color = params["color"]
    @pigeon.gender = params["gender"]
    @pigeon.lives = params["lives"]
    @pigeon.save
    redirect "/pigeons"
  end

  patch '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.name = params["name"]
    @pigeon.color = params["color"]
    @pigeon.gender = params["gender"]
    @pigeon.lives = params["lives"]
    @pigeon.save
    redirect "/pigeons/#{@pigeon.id}"
  end

  delete '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    @pigeon.destroy
    redirect "/pigeons"
  end

end