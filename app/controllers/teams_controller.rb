class TeamsController < ApplicationController
  def new
    @team = Team.new
  end
  
  def index
    @teams = Team.all
  end
  
  def create
	@team = Team.new(
		name: params[:team][:name],
		pokemon1: params[:teams][:pokemon][1],
		pokemon2: params[:teams][:pokemon][2],
		pokemon3: params[:teams][:pokemon][3],
		pokemon4: params[:teams][:pokemon][4],
		pokemon5: params[:teams][:pokemon][5],
		pokemon6: params[:teams][:pokemon][6],
	)
	#@team.add(params[:team][:pokemon])
	success = @team.save
    
    if success then
	  redirect_to teams_path
    else
	  render :new
    end
  end
  
=begin
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
    else 
      render :new
    end
  end
=end
  
end
