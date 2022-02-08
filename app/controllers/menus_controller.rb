class MenusController < ApplicationController
  def index
    @menus = Menu.all.includes(:dish)
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to root_url, notice: "Menu was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def menu_params
    params.require(:menu).permit(:name)
  end
end
