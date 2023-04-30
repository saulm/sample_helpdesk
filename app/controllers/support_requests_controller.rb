class SupportRequestsController < ApplicationController
  def new
    @support_request = SupportRequest.new
  end

  def create
    @support_request = SupportRequest.new(support_request_params)
    if @support_request.valid?
      @support_request.save!
      flash[:notice] = "Request created successfully"
      redirect_to action: "new"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def support_request_params
    params.require(:support_request).permit(:name, :email, :description)
  end
end
