class WelcomeController < ApplicationController

  def index
    @feeds = CentralMangas.new
  end

end
