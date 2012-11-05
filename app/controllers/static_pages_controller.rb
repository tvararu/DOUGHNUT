class StaticPagesController < ApplicationController
  def show
    render template: current_page
  end
end
