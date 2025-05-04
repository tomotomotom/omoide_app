class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    current_user.likes.create(post: @post)
    render partial: "posts/like_buttons", locals: { post: @post }
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    current_user.likes.find_by(post: @post)&.destroy
    render partial: "posts/like_buttons", locals: { post: @post }
  end
  
end
