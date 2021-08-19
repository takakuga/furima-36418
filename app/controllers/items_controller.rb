class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]

  def index
  end

  def new
  end

end
