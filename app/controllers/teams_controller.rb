class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(
      name: params[:team][:name])
    @team.save
    redirect_to teams_path
  end

  def index
    @teams = Team.all
  end
end
