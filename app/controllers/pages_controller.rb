class PagesController < ApplicationController

  def index
  end

  def show
    render template: "pages/#{params[:page]}"
  end

  def pages
  end

  def sobre
  	render template: "pages/#{params[:page]}"
  end

end
