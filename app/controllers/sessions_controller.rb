class SessionsController < ApplicationController
    def index
    @employ = Employ.all
    end
    def new
       @employ = Employ.new
    end

    def show
      @employ = Employ.find(params[:id])
    end

    def create

      employ = Employ.find_by(email: params[:email],type: params[:type] ,password: params[:password])
       
      if (params[:type] == "Employer")
        if(employ)
          session[:employ_id] = employ.id
          redirect_to employs_path
          flash[:notice] = "You are a employer."
           
        else 
          flash[:notice] = "You email or password is wrong."
          redirect_to new_session_path 
        end     
      elsif (params[:type] == "Employe")
          if(employ)
          session[:employ_id] = employ.id
          redirect_to employs_path
          flash[:notice] = "You are a employe."
           
          else 
          flash[:notice] = "You email or password is wrong."
          redirect_to new_session_path 
          end
        end  
    end


    def destroy
      session.delete(:employ_id)
      flash[:notice] = "You have successfully logged out."
      redirect_to root_path
    end

    private
    def employ_params
      params.require(:employ).permit(:name, :contact ,:email, :type)
    end
end
