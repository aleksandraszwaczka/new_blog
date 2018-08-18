class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at desc")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(params[:post].permit(:title, :content))

    redirect_to action: "index"
  end

  def destroy
    @post = Post.find(params[:id])
    #wyszukujemy posta
    @post.destroy!
    #usówamy posta
    redirect_to action: "index"
    #wracamy do indexu, żeby nie tworzyć nowego widoku dla destroy po usunięciu posta
  end
end
