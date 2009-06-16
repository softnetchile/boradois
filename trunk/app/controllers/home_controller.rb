class HomeController < ApplicationController
	layout 'layout'
	def index
		@hello = "Bem vindos ao hotel boradois!"
	end
end
