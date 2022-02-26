class StudiosController < ApplicationController
  def home
  end
  
  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
  end

  def new
    @studio = Studio.new
  end

  def edit
    @studio = Studio.find(params[:id])
  end

  def update
    @studio = Studio.find(params[:id])

    if @studio.update(studio_params)
      redirect_to @studio
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @studio = Studio.new(studio_params)

    if @studio.save
      redirect_to @studio
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @studio = Studio.find(params[:id])
    @studio.destroy

    redirect_to root_path, status: :see_other
  end

  def search
  end

  def results
    @studios = Studio.all
  end

  private
    def studio_params
      params.require(:studio).permit(:name, :description, :style)
    end

end
