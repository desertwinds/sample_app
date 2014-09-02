class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
  		if user && user.authenticate(params[:session][:password])
    		flash.now[:success] = "Welcome to the Sample App!"
    		sign_in user
      	redirect_back_or user
  		else
    		# Create an error message and re-render the signin form.
    		flash.now[:error] = "Clave o correo incorrecto"
    		render 'new'
  		end
	end

	def destroy
    sign_out
    redirect_to root_path
	end
end
