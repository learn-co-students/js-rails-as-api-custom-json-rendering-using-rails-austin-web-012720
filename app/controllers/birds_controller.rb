class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find(params[:id])
    render json: bird
  end

end