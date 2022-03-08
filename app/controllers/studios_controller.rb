class StudiosController < ApplicationController
  def home
    @styles = Style.all
    @distinct_studio_cities = Studio.select('DISTINCT city')

    @distinct_studio_cities.each do |c|
      puts c.city
    end
  end

  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
    @reviews = @studio.reviews.where.not(stars: nil)
    @review = Review.new

    if @reviews.length == 0
      @avg_stars = 'No ratings'
    else
      @avg_stars = 0.0
      @reviews.each do |r|
        @avg_stars += r.stars
      end
      @avg_stars = @avg_stars / @reviews.length
    end

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
    puts "in search function"
    # params[:name_query]
    # params[:style]
    # params[:location]
    
    @studios = Studio.where(["name like ?", "%#{params[:name_query]}%"])

    if params[:style] != "all"
      @studios = @studios.where(["style = ?", params[:style]])
    end

    if params[:city] != "all"
      @studios = @studios.where(["city = ?", params[:city]])
    end

  end

  private
    # def search_params
    #   params.require(:studio).permit(:name, :description, :style)
    # end

    def studio_params
      params.require(:studio).permit(:name, :description, :style)
    end

    def review_params
      params.require(:review).permit(:stars, :detail)
    end

end
