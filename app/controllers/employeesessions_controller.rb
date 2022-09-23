class EmployeesessionsController < ApplicationController

    def new
       @employee = Employee.new
    end
    def index
       @employee = Employee.all
    end

      def show
      @employee = current_employee
      end

    def create
      employee = Employee.find_by(email: params[:email] , password: params[:password])

      if(employee)
          session[:employee_id] = employee.id
          redirect_to employeesessions_path
      else 
        flash[:notice] = "You email or password is wrong."
           redirect_to new_employeesessions_path 
      end 
    end


    def destroy
          session.delete(:employee_id)
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
    end

    private
    def employee_params
      params.require(:employee).permit(:name, :password)
    end
end


