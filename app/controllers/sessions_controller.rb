class SessionsController < ApplicationController
    def index
    @employees = Employee.all
    end
    def new
       @employee = Employee.new
    end

    def show
      @employee = Employee.find(params[:id])
    end

    def create

      employee = Employee.find_by(email: params[:email],type: params[:type] ,password: params[:password])
       
      if (params[:type] == "Admin")
        if(employee)
          session[:employee_id] = employee.id
          LoginNotificationMailer.create_notification(employee).deliver_now
          redirect_to employees_path
          flash[:notice] = "You are a Admin."
           
        else 
          flash[:notice] = "You email or password is wrong."
          redirect_to new_session_path 
        end     
      elsif (params[:type] == "Employe")
          if(employee)
          session[:employee_id] = employee.id
           LoginNotificationMailer.create_notification(employee).
          deliver_now
          redirect_to employees_path
          flash[:notice] = "You are a employe."
           
          else 
          flash[:notice] = "You email or password is wrong."
          redirect_to new_session_path 
          end
        end  
    end


    def destroy
      session.delete(:employee_id)
      flash[:notice] = "You have successfully logged out."
      redirect_to root_path
    end

    private
    def employee_params
      params.require(:employee).permit(:name, :contact ,:email, :type)
    end
end
