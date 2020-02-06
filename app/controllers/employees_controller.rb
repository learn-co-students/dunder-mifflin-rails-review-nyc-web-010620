class EmployeesController < ApplicationController

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
        @employee = Employee.new(employee_params)
        if @employee.save
            flash[:message]  ="Successfully created"
            redirect_to employee_path(@employee)
        else 
            flash.now[:message] = @employee.errors.full_messages[0]
            render :new
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url,:dog_id)
    end

end