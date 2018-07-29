class HomeController < ApplicationController
	def index
		
	end

	def authorization
		if params[:token].present?
		  payload = JWT.decode params[:token], 'HS256'
		end
		render json: payload, status: :ok
	  end
	
end
