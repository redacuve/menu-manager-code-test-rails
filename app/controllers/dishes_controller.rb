class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to dishes_url, notice: "Dish was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def dish_params
    params.require(:dish).permit(:name, :price, :menu_id)
  end
end
