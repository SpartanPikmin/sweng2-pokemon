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
    move1: params[:pokemon][:move1],
    move2: params[:pokemon][:move2],
    move3: params[:pokemon][:move3],
    move4: params[:pokemon][:move4],
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
