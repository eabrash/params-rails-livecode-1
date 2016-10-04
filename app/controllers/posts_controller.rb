class PostsController < ApplicationController

  def index
    @welcome_msg = "Hola Amig@!"
    @posts = Post.all
  end

  def show
    @mypost = Post.find(params[:id].to_i)

    if @mypost == nil
      render :file => 'public/404.html', :status => :not_found
    end

  end

  def new
    @mypost = Post.new
    @path = "create"
    @http_verb = "post"
  end

  def create
    @params = params
    @mypost = Post.new

    @mypost.title = params[:post][:title]
    @mypost.author = params[:post][:author]
    @mypost.body = params[:post][:body]

    @mypost.save

    # @mypost = params
    # @mypost[:id]=PostsController.allposts.last[:id]+1

  end

  def edit

    @path = "update"
    @mypost = Post.find(params[:id])
    @http_verb = "patch"

    if @mypost == nil
      render :file => 'public/404.html', :status => :not_found
    end

  end

  def update

    @mypost = Post.find(params[:id])

    @mypost.title = params[:patch][:title]
    @mypost.author = params[:patch][:author]
    @mypost.body = params[:patch][:body]

    @mypost.save

  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to action: "index"
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
