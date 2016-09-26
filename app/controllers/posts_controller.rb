class PostsController < ApplicationController
  def index
    @welcome_msg = "Hola Amig@!"
    @posts = PostsController.allposts
  end

  def show
    @posts = PostsController.allposts
    @mypost = nil

    @posts.each do |post|
      if post[:id] == Integer(params[:id])
        @mypost = post
      end
    end

    if @mypost == nil
      @mypost = {id: Integer(params[:id]), title: "Did not find", author: "", body: "", image: "http://placekitten.com/400/400"}
    end

  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def self.allposts
    [
      {id: 1, title: "My first blog post", author: "Dave Matthews", body: "Lorem ipsum music etc.", image: "https://placekitten.com/100/200"},
      {id: 2, title: "My second blog post", author: "Totoro", body: "Lorem ipsum forest mushroom etc.", image: "https://placekitten.com/200/200"},
      {id: 3, title: "My third blog post", author: "Chewbacca", body: "Lorem ipsum starship etc.", image: "https://placekitten.com/200/150"}
    ]
  end
end
