class StaticPagesController < ApplicationController
  def home
     @carousels = Carousel.all
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
