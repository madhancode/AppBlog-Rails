class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
      @posts = Post.all.includes(:user,:likes).order("created_at DESC")
  end

  def new
      @post = Post.new
  end

  def create
      @post = current_user.posts.build(post_params)
      if @post.save!
          redirect_to posts_path, :notice => "Your Post has been Saved"
      else
          render "new"
      end
  end

  private
      # params[:post]   --> Replacement
      def post_params
          params.require(:post).permit(:title, :image , :content)
      end
        
end