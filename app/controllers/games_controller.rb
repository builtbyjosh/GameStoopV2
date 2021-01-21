class GamesController < ApplicationController
    def index
        @games = Game.all
    end

    def show
        @line_item = LineItem.new
        @game = Game.find_by(id: params[:id])
        if @game
            render :show
        else
            redirect_to games_path
        end
    end

    def fps
        @games = Game.fps
        render :index
    end

    def strategy
        @games = Game.strategy
        render :index
    end
    
    def simulation
        @games = Game.simulation
        render :index
    end

    def platformer
        @games = Game.platformer
        render :index
    end
end
