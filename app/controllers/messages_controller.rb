class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :edit, :update, :destroy]

	def index
		@messages = Message.all.order("created_at DESC")
	end

	def show
	end

	def new
		@message = current_user.messages.build
	end

	def create
		@message = current_user.messages.build(message_params)
		if @message.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end
	
    def truncate(text, options = {}, &block)
        if text
          length  = options.fetch(:length, 30)
          content = text.truncate(length, options)
          content = options[:escape] == false ? content.html_safe : ERB::Util.html_escape(content)
          content << capture(&block) if block_given? && text.length > length
          content
        end
    end




	def update
		if @message.update(message_params)
			redirect_to message_path
		else
			render 'edit'
		end
	end

	def destroy
		@message.destroy
		redirect_to root_path
	end

	private
		def message_params
			params.require(:message).permit(:title, :description)
		end

		def find_message
			@message = Message.find(params[:id])
		end
		

end
