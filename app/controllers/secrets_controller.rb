class SecretsController < ApplicationController
  def new
    @secret = Secret.new
    @recipient_id = params[:user_id]
    render :new
  end

  def create
    @secret = Secret.new(secret_params)
    if @secret.save
      redirect_to user_url(@secret.recipient_id)
    else
      flash.now[:errors] = @secret.errors.full_messages
      render :new
    end
  end

  private
  def secret_params
    params.require(:secret).permit(:title, :recipient_id, :author_id)
  end
end
