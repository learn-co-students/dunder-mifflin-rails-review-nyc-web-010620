class DogsController < ApplicationController
    def index 
        @dogs = Dog.all
    end 

    def new
        @dog = Dog.new
    end
    
 
    def create 
        @dog = Dog.new(dog_params)
        if @dog.save
            redirect_to dog_path(@dog)
        else
            render :new
        end
    end 

    def edit 
        @dog = Dog.find(params[:id])
    end 

    def update 
        @dog = Dog.find(params[:id])
        if @dog.update(dog_params)
            redirect_to dog_path(@dog)
        else
            render :edit
        end 
    end 

    def show 
        @dog = Dog.find(params[:id])
    end

    private 

    def dog_params
        params.require(:dog).permit(:name, :breed, :age, :employee_id)
    end 
end

