class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "投稿が完了しました！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "投稿を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "投稿を削除しました！"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    redirect_to root_path, alert: "不正なアクセスです" unless @post.user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
