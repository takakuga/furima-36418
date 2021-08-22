class BuysController < ApplicationController

  def index
    @buy = Buy.new(buy_params)
  end

end
