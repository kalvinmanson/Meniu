class WebController < ApplicationController
	before_action :find_model

	def index

	end

	def how

	end

	def set_location
		if params[:latitude].present? && params[:longitude].present?
			session[:latitude] = params[:latitude]
			session[:longitude] = params[:longitude]
		else
			session[:latitude] = request.location.latitude
			session[:longitude] = request.location.longitude
		end

		if current_user.present?
			current_user.latitude = session[:latitude]
			current_user.longitude = session[:longitude]
			current_user.save
		end
		render json: '{"latitude": "'+ session[:latitude] +'", "longitude": "'+ session[:longitude] +'"}'
	end

	private
	def find_model
		#@model = Model.find(params[:id]) if params[:id]
	end
end