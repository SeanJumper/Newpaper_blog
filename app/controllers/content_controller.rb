class ContentController < ApplicationController

  def world
    # get all posts where genre = ^ and public = true
  end

  def politics
        # get all posts where genre = ^ and public = true

  end

  def sport
      # this condition selects all from the post where Sport is the Genre and Public is true 
      # SELECT "posts".* FROM "posts" WHERE "posts"."Genre" = ? AND "posts"."Public" = ?  [["Genre", "Sport"], ["Public", 1]]
      @posts = Post.where(Genre:'Sport',Public:true)
      
  end

  def design
        # get all posts where genre = ^ and public = true

  end

  def culture
        # get all posts where genre = ^ and public = true

  end

  def business
        # get all posts where genre = ^ and public = true

  end

  def travel
        # get all posts where genre = ^ and public = true

  end

  def science
        # get all posts where genre = ^ and public = true

  end

  def opinion
        # get all posts where genre = ^ and public = true

  end

  def technology
        # get all posts where genre = ^ and public = true

  end

  def health
        # get all posts where genre = ^ and public = true

  end
  
end
