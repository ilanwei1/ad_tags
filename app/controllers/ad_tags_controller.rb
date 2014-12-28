class AdTagsController <  ApplicationController
	skip_before_filter :verify_authenticity_token
	respond_to :js,:json,:html

	def new
  	 @ad_tag = AdTag.new
	end

	def create
	    @ad_tag = AdTag.new(adtag_params)
		if @ad_tag.save
			IpConverterJob.perform_async(@ad_tag.id)
			respond_with @ad_tag
		else
		  render "new"
		end
	end

	def show
		@ad_tag = AdTag.find(params[:id])
		render :json => @ad_tag.to_json
	end

	private
	  def adtag_params
	    params.require(:ad_tag).permit(:name,:ip,:size)
	  end
end
