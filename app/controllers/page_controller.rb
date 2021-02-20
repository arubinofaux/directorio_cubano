class PageController < ApplicationController
  def index
    render json: {"hi": ":)"}
  end
end
