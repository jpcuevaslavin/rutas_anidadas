class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @category = Category.find(params[:category_id])
    @movies = @category.movies

    # Estas instrucciones traen la misma colección
    # @movies = Movie.where(category_id: @category.id)
    # @movies = Movie.where(category: @category)

  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @category = Category.find(params[:category_id])
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @category = Category.find(params[:category_id])
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create

    @movie = Movie.new(movie_params)
    @movie.category_id = params[:category_id]

    respond_to do |format|
      if @movie.save
        format.html { redirect_to category_movie_path(@movie.category, @movie), notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @category = Category.find(params[:category_id])
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to category_movies_path(@category), notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :year)
    end
end
