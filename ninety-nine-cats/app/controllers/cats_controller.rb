class CatsController < ApplicationController 

    def index
        @cats = Cat.all
        render :index
    end 

    def new
        render :new
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :new
        end
    end

    def show
        @cat = Cat.find(params[:id])
        render json: @cat
    end

    def update
        @cat = Cat.find(params[:id])
        if @cat.update(cat_params)
            redirect_to cat_url
        else
            render json: @cat.errors.full_messages, status: :unprocessable_entity
        end
    end


    def cat_params
        params.require(:cats).permit(:name,:birthdate,:color,:sex,:description)
    end

end
