class CatsController < ApplicationController

  def index

    # if params[:id]
    #   @cat = Cat.find_by(id: params[:id])
    #   render :show
    #
    #   # possibly redirect to show ?
    # else
      @cats = Cat.all
      render :index
    # end

  end

  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      redirect_to :cats # becomes cats_url
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      render :show
    else
      render :new
    end

  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    

    if @cat.update_attributes(cat_params)
      render :show

    else
      redirect_to edit_cat_url(@cat)
    end
  end
end
