class RestaurantsController < ApplicationController
	 before_action :authenticate_owner!, only: [:edit, :new]
	
	def index
		@restaurants = Restaurant.all
	end
	
	def show
		@restaurant = Restaurant.find(params[:id])
	end
	
	before_action 
	def new
		@restaurant = Restaurant.new
	end
	

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to @restaurant
		else
			render "new"
		end
	end
	
	def update
		@restaurant = Restaurant.find(params[:id])
		
		if @restaurant.update(params[:restaurant].permit(:id, :name, :description, :address, :phone_number))
			redirect_to @restaurant
		end	
	end
	
	def edit
		@restaurant = Restaurant.find(params[:id])
	end
	
	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
 
		redirect_to restaurants_path
	end
	
	private
		def restaurant_params
			params.require(:restaurant).permit(:id, :name, :description, :address, :phone_number) 	
		end
end
