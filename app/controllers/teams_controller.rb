class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(
      name: params[:team][:name]
	)
    @pokemons = PokemonBuilder.new(params)
    if @pokemons.build
      @team.pokemon = @pokemons.pokemons
      success = @team.save
      if success then
        redirect_to teams_path
      else
        render :new
      end
    end
  end

  def index
    @teams = Team.all
  end
end
