class KopisController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]
  def index
    if current_user.admin == true 
        puts "hey"
      end
    # test to see if we are at /origins/:origin_id/kopis or /kopis
     if params.has_key?(:origin_id)
       # get all the kopis for a specific park
       @kopis = Kopi.where(origin_id: params[:origin_id] )
       @origin = Origin.find(params[:origin_id])
     else
       # get all kopis
       @kopis = Kopi.all
     end
  end

  def show
    @kopis = Kopi.find(params[:id])

  end

  def new
      # @number = params[:origin_id]
      if current_user.admin == true 
        puts "hey"
      end
      @origin = params[:origin_id]
      @origins = Origin.all
      @roasts = Roast.all

  end

  def edit
  end

  def create


    @kopi =  Kopi.new(kopi_params)
    @kopi.save
    
    render plain: kopi_params

  end

  def update
  end

  def destroy
  end

private
def kopi_params
  params.require(:kopis).permit(:name, :origin_id, :roast_id)
end
end