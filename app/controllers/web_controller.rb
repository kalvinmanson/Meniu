class WebController < ApplicationController
	before_action :find_model

	def index

	end

	private
	def find_model
		#@model = Model.find(params[:id]) if params[:id]
	end
end