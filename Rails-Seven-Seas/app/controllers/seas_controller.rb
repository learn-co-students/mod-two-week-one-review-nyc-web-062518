class SeasController < ApplicationController
#   seas    GET    /seas            seas#index
#           POST   /seas(.:format)  seas#new
# edit_sea  GET /seas/:id/edit      seas#edit
#   sea     GET    /seas/:id        seas#show
#           PATCH  /seas/:id        seas#update
#           PUT    /seas/:id        seas#update
#           DELETE /seas/:id        seas#destroy

  def index
    @seas = Sea.all
  end

  def new
    @sea = Sea.new
  end

  def create
    @sea = Sea.create(sea_params)
    redirect_to "/seas/#{@sea.id}"
  end


  def show
    # binding.pry
    @sea = Sea.find_by(id: params[:id])
  end

  def edit
    @sea = Sea.find_by(id: params[:id])
  end

  def update
    binding.pry
    @sea = Sea.update(params["id"], sea_params)
    redirect_to "/seas/#{@sea.id}"
  end

  def destroy
    Sea.destroy(params["id"])
    redirect_to "/seas"
  end



  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!

  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end




end
