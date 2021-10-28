class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿が完了しました"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page]).per(5)
    @post_like_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "変更しました"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search #検索機能
    if params[:keyword].present?
      @posts = Post.where('title LIKE ?', "%#{params[:keyword]}%").page(params[:page]).per(9) #:keywordが:titleに含まれているものを表示
      @keyword = params[:keyword]
    else
      @posts = Post.page(params[:page]).per(9) #空白で検索した場合
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :picture, :cook)
  end

end
