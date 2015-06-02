class CharactersController < ApplicationController
  authorize_resource

  def index
    @characters = if params[:house]
      @house = params[:house]
      Character.where(house: @house)
    else
      Character.all
    end
  end

  def show
    @character = Character.find(params[:id])
  end
end
