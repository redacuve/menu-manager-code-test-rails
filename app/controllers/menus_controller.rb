class MenusController < ApplicationController
  def index
    @menus = Menu.all.includes(:dish)
  end

  def new
  end

  def create
  end
end
