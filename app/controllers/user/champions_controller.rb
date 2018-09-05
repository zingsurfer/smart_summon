class User::ChampionsController < ApplicationController

  def index
    # if there's a role_id, get favorite champions for that role, otherwise, get favorite champions
    if params[:role_id]
      role = Role.find(params[:role_id])
      @champions = current_user.champions.select do |champion|
        champion.roles.include?(role)
      end
    else
      @champions = current_user.champions
    end
  end

end
