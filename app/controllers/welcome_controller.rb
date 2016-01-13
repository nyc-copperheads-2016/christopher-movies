class WelcomeController < ApplicationController

  def index
    @folder = Folder.first
  end
end