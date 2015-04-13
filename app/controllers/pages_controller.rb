class PagesController < ApplicationController
  def about
    @pages = Page.all
  end

  def contact
    @pages = Page.all
    
  end
end
