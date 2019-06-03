class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do

    @pet = Pet.create(params[:pet])
<<<<<<< HEAD
    if !params[:owner][:name].empty?
    @pet.update(owner: Owner.create(name: params[:owner][:name]))
    end
=======

    if !params[:owner][:name].empty?
      @owner = Owner.create(name: params[:owner][:name])
      @pet.owner = @owner
    else
      #binding.pry
      @pet.owner = Owner.find(params[:pet][:owner_id].first)
      #@pet.update(owner: @owner)
    end
    @pet.save
>>>>>>> a174ccb12f8e40d5cb434b8e09469d6c1ca9d8e5
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    @owner = @pet.owner
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end

  patch '/pets/:id' do

    @pet = Pet.find(params[:id])

    if !params[:pet].keys.include?("owner_id")
      params[:pet][:owner_id] = []
    end

    @pet.update(params[:pet])


    if !params[:owner][:name].empty?
      @owner = Owner.create(params[:owner])
      @pet.update(owner: @owner)
    end
    redirect to "pets/#{@pet.id}"
  end
end
