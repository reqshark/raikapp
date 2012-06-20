class FilesController < ApplicationController
	def index
		@files = Ripple.client['files'].keys
	end
	
	def create
		uploaded = params[:file]
		key = ::File.basename(uploaded.original_filename)
		Ripple.client['files'].new(key).tap do |robj|
			robj.data = uploaded.read
			robj.content_type = uploaded.content_type
			robj.store
		end
		redirect_to files_path
	end
	
	def show
		key = [params[:id],params[:format]].compact.join(".")
		if Ripple.client['files'].exists?(key)
			headers["X-Accel-Redirect"] = "/riak/files/#{key}"
			head :ok
		else
			redirect_to files_path
		end
	end
end