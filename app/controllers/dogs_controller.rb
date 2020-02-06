class DogsController < ApplicationController

def index
    @dogs = Dog.all 
end

def show
    @dog = Dog.find(params[:id])
    @employees = Employee.all
end

def sort_it
    @dogs = Dog.all.sort {|a,b| a.employees.count <=> b.employees.count}
    redirect_to dogs_path
end

end
