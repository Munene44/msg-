class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@messages = Message.all.order("created_at DESC")
	end

	def show
		
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			redirect_to root_path
		else
			render 'new'

			end
		end
			def edit

			end

			def update
				if @message.update(message_params)
					redirect_to message_path
				else
					render 'edit'
				end
			end


			def destroy
				if @message.destroy
					redirect_to root_path
				end
			end
	end
	 private

	 def message_params
	 	params.require(:message).permit(:title, :description, :picture)
	 end

	 def find_message
	 	@message = Message.find(params[:id])
	 

end
