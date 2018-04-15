class PagesController < ApplicationController
  def index
    @Users = User.all
  end
end