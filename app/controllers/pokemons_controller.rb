class PokemonsController < ApplicationController
	def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(
      species: params[:pokemon][:species])
    @pokemon.save
    redirect_to pokemons_path
  end

  def index
    @pokemons = Pokemon.all
  end
end
