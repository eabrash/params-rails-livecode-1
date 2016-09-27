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

  def create
    @params = params
    @user_params = user_params
    @title = user_params[:title]
    @author = user_params[:author]
    @body = user_params[:body]
    @image = user_params[:image]

    @mypost = {id: PostsController.allposts.last[:id]+1, title: @title, author: @author, body: @body, image: @image}

    # @mypost = params
    # @mypost[:id]=PostsController.allposts.last[:id]+1

  end

  def edit

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

  def update
    @title = user_params[:title]
    @author = user_params[:author]
    @body = user_params[:body]
    @mypost = {id: params[:id].to_i, title: params[:title], author: params[:author], body: params[:body], image: params[:image]}
    @mypost = params
    @mypost[:id] = @mypost[:id].to_i
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

  private
  def user_params
    params.permit(:title,:author,:body,:id,:image)
  end

end
