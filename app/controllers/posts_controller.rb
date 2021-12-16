class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "Post added!" }
      else
        format.html { render :index }
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            @post,
            partial: 'posts/form',
            locals: { post: @post }
          )
        }
      end
    end
  end

  def like
    Post.find_by(id: params[:post_id]).increment(:likes_count)
    redirect_to posts_path
  end

  def repost
    Post.find_by(id: params[:post_id]).increment(:repost_count)
    redirect_to posts_path
  end

  private

  def posts_params
    params.require(:post).permit(:body, :username)
  end
end
