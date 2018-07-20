class SeasController < ApplicationController
  #define your controller actions here
  def index
    @seas = Sea.all
  end

  def create
    # @sea = Sea.create(
    #   name: params[:sea][:name],
    #   temperature: params[:sea][:temperature],
    #   bio: params[:sea][:bio],
    #   image_url: params[:sea][:image_url],
    #   mood: params[:sea][:mood],
    #   favorite_color: params[:sea][:favorite_color],
    #   scariest_creature: params[:sea][:scariest_creature],
    #   has_mermaids: params[:sea][:has_mermaids]
    # )
    @sea = Sea.create(sea_params)
  end

  def new
    @sea = Sea.new
  end

  def edit
    @sea = Sea.find_by(id: params[:id])
  end

  def show
    @sea = Sea.find_by(id: params[:id])
  end

  def update
    @sea = Sea.find_by(id: params[:id])
  end

  def destroy
    @sea = Sea.find_by(id: params[:id])
  end

  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
