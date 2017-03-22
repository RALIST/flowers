class Customer::CommentsController < Customer::CustomerController

  def create
    case
    when params[:company_id]
      @commentable = Company.find(params[:company_id])
    when params[:comment_id]
      @commentable = Comment.find(params[:comment_id])
    end
    @comment = @commentable.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_back fallback_location: root_path
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:title, :desc)
  end
end
