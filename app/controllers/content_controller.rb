class ContentController < ApplicationController

  def world
    # get all posts where genre = ^ and public = true
    @posts = Post.where(Genre:'world',public:true)
  end

  def politics
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'politics',public:true)

  end

  def sport
      # this condition selects all from the post where Sport is the Genre and Public is true 
      # SELECT "posts".* FROM "posts" WHERE "posts"."Genre" = ? AND "posts"."Public" = ?  [["Genre", "Sport"], ["Public", 1]]
      @posts = Post.where(Genre:'Sport',public:true)
      
  end

  def design
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'design',public:true)

  end

  def culture
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'culture',Public:true)

  end

  def business
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'business',public:true)

  end

  def travel
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'Travel',public:true)

  end

  def science
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'science',public:true)

  end

  def opinion
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'opinion',public:true)
  end

  def technology
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'technology',public:true)
  end

  def health
        # get all posts where genre = ^ and public = true
        @posts = Post.where(Genre:'health',public:true)
  end

  def weather
      @app = WeatherStation.new('weather')
      @app.run
      @response = @app.getInfo
      p "THIS IS THE CONTROLLER ************************************************************************************"
      p @response
      
      
    end
  
end
