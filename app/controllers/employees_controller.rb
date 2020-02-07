class EmployeesController < ApplicationController
    
    def index 
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            flash[:message] = 'Employee successfully created!!'
            redirect_to employee_path(@employee)
        else
            flash.now[:message] = @employee.errors.full_messages[0]
            render :new
        end
    end

    def edit
        @employee = Employee.find_by_id(params[:id])
    end

    def update
        @employee = Employee.find_by_id(params[:id])

        if @employee.update(employee_params)
            flash[:message] = 'Employee successfully updated!!'
            redirect_to employee_path(@employee)
        else
            flash.now[:message] = @employee.errors.full_messages[0]
            render :edit
        end
    end

    def show
        @employee = Employee.find_by_id(params[:id])
    end

    private
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
