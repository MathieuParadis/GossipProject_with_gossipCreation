class HomeController < ApplicationController
  def index
    puts "@" * 60
    puts "Inside Home controller"
    puts "@" * 60

    @gossips = Gossip.all

  end
end
