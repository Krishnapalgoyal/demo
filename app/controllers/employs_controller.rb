class EmploysController < ApplicationController
 before_action :require_login

  def new 
    @employ = Employ.new
    @employ.addresses.new
  
  end
  def index
    @employs= Employ.all
  end

  def show
    @employ = Employ.find(params[:id])
  end

  def create

     @employ = Employ.new(employ_params)
    if @employ.save
      redirect_to employs_path
    else
       render new
    end

  end

  def edit
    @employ = Employ.find(params[:id])
  end

  def update
    @employ = Employ.find(params[:id])

    if @employ.update(employ_params)
      redirect_to @employ
    else
      render :edit
    end
  end

  def destroy
    # if current_user
    #   redirect_to root_path 
    #   flash[:notice] = "you dont delete your self plese log out "
    # else 
    @employ = Employ.find(params[:id])
    @employ.destroy
    redirect_to employs_path
  # end
  end
private
    def employ_params
   
      params.require(:employ).permit(:name, :contact ,:email ,:type, :password,:department_id ,addresses_attributes: [:id, :c_address, :p_address])
    end
end




