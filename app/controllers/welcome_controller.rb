class WelcomeController < ApplicationController

  def index
    @feeds = CentralMangas.lancamentos

    respond_to do |format|
      format.html
      format.json { render json: @feeds, root: false }
    end
  end

end
