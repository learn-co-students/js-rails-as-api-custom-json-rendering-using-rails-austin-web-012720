class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds

    # to limit what can be fetch()ed ....
    # render json: birds, only: [:id, :name, :species]
    # ....... OR .......
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    # bird = Bird.find_by(id: params[:id])
    # render json: bird
    
    # refactored
    # bird = Bird.find(params[:id])
    bird = Bird.find_by(id: params[:id])

    # render json: {id: bird.id, name: bird.name, species: bird.species}
    # ....... OR ........
    # render json: bird.slice(:id, :name, :species)
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: {message: 'Bird not found'}
    end 
  end 
end