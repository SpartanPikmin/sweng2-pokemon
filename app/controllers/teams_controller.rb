class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(
      name: params[:team][:name])
    @pokemons = PokemonBuilder.new(params[:team])
    success = @team.save
    if success then
      redirect_to teams_path
    else
      render :new
    end
  end

  def index
    @teams = Team.all
  end
end
