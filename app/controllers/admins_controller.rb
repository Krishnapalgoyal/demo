class AdminsController < ApplicationController
   
  before_action :require_login

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(article_params)

    if @admin.save
      redirect_to @admin
    else
      render :new
    end
  end

 

  private
    def article_params
      params.require(:admin).permit(:name, :contact ,:email, :password)
    end
end
