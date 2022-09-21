class SessionsController < ApplicationController


     def new
       @user = Admin.new
    end

      def show
      @admin = Admin.find(params[:id])
  end

    def create
      admin = Admin.find_by(email: params[:email] , password: params[:password])

      if(admin)
          session[:admin_id] = admin.id
          redirect_to employees_path
      else 
        flash[:notice] = "You email or password is wrong."
           redirect_to new_sessions_path 
      end 
    end


    def destroy
          session.delete(:admin_id)
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
    end

    private
    def article_params
      params.require(:admin).permit(:name, :contact ,:email, :password)
    end
end
