class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.product_id = params[:product_id]
    respond_to do |format|
      if @comment.save
        flash[:notice] = "评论成功"
        format.js 
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :flag)
  end
end
