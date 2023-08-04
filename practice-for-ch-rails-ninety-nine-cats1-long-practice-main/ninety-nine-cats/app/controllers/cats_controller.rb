class CatsController < ActionController::Base
    def index
        @cats = Cat.all
        render json: @cats
    end

    def create
        cat = Cat.new(self.cat_params)
        if cat.save
            render json: cat
        else
            render json: cat.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        cat = Cat.find(params[:id])
        render json: cat
    end

    def update
        cat = Cat.find(params[:id])
        cat.update(self.cat_params)
        render json: cat
    end

     def cat_params
        params.require(:cat).permit(:name)
    end
end