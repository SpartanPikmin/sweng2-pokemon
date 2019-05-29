class PokemonsController < ApplicationController
  def new
    @pokemon = Pokemon.new
    @teams = Team.all
  end

  def create
    @pokemon = Pokemon.new(
      species: params[:pokemon][:species],
	  primary_type: params[:pokemon][:primary_type],
	  secondary_type: params[:pokemon][:secondary_type],
	)
    if @pokemon.save
      redirect_to pokemons_path
    else
      render :new
    end
  end

  def index
    @pokemons = Pokemon.all
  end
end
