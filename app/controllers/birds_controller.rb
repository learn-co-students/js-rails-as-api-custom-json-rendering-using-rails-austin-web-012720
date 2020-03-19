class BirdsController < ApplicationController

  before_action :get_bird, only: [:show]

  def index
    # cont note: n-1
    # continued from note n-1 below in show :In this case, 
    # we can add in the only: option directly after listing 
    # an object we want to render to JSON:

    birds = Bird.all
    render json: birds, only: [:id, :name, :species]

    # this will do the same as above it just specifies what attributes to exclude than accept and can be 
    # written in this stripped down version. Under the below code is whats really happening: the .to_json 
    # method is taking care of a lot of work under the hood.

    # render json: birds, except: [:created_at, :updated_at]

    #render json: birds.to_json(except: [:created_at, :updated_at])

  end

  def show 
    if @bird
      # WE CAN SPECIFY WHICH ATTRIBUTES TO GIVE TO THE API TWO WAYS
      #1.
      # render json: {id: @bird.id, name: @bird.name, species: @bird.species}
      #2.
      render json: @bird.slice(:id, :name, :species)
    else
      render json: { message: 'Bird not found'}
    end
    

    # This achieves the same result but in a slightly different 
    # way. Rather than having to spell out each key, the Hash slice 
    # method returns a new hash with only the keys that are passed 
    # into slice. In this case, :id, :name, and :species were passed 
    # in, so created_at and updated_at get left out, just like before.

    # note: n-1
    # This won't work for an array of hashes like the one we have in our index action:

  end

  private 

  def get_bird
    @bird = Bird.find_by(id: params[:id])
  end


end