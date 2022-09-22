class AdminsController < ApplicationController
   
 

  before_action :require_login
def new
    @admin = Admin.new
  end
   def index
    @admin = Admin.all
  end
  
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to @admin
    else
      render :new
    end
  end

def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])

    if @admin.update(admin_params)
      redirect_to @admin
    else
      render :edit
    end
  end

 def show
   @admin = Admin.find(params[:id])
  end
 

  private
    def admin_params
      params.require(:admin).permit(:name, :contact ,:email, :password)
    end
end
