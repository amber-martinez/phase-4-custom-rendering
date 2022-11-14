class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all

    if cheeses
      render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
    else 
      render json: { error: 'Cheese not found' }, status: :not_found
    end

  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])

    if cheese
    render json: {
      id: cheese.id,
      name: cheese.name,
      price: cheese.price,
      is_best_seller: cheese.is_best_seller
    }
    else 
      render json: { error: 'Cheese not found' }
    end
  end

end
