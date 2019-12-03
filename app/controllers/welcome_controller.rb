class WelcomeController < ApplicationController
  def index
    @world=[]
    @sport=[]
    @business=[]
    @other=[]
    posts = Post.where(Public:true)
    
    posts.each do |post|
      if post.Genre === 'World'
        @world << post
        
      elsif 
        post.Genre === 'Sport'
        @sport << post

      elsif
        post.Genre === 'Business'
        @business << post
      else
        @other << post
      end   
        p @world
        p @sport
        p @business
        p @other
  end
  
  #SELECT "active_storage_blobs".* FROM "active_storage_blobs" WHERE "active_storage_blobs"."id" = ? LIMIT ?  [["id", 4], ["LIMIT", 1]]

 end
end
