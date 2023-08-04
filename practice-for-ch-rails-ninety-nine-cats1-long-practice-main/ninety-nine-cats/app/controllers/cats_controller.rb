class CatsController < ActionController::Base
    def index
        @cats = Cat.all
        render json: @cats
    end

    def create
        
    end

    def show

    end

    def update

    end

     def cats_params
        params.require(:cat).permit(:name)
    end
end