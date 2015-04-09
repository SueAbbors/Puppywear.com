class PagesController < ApplicationController
  def about
    @pages = Page.about
  end

  def contact
    @pages = Page.contact
  end
end
