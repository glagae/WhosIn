class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    @comment.invitation = current_user.invitation(@comment.event)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to event_path(@comment.event) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'events/show' }
        format.js  # <-- idem
    end
    end
  end

  def update
    authorize @comment
    byebug
  end

  def destroy
    authorize @comment
    event = @comment.event
    @comment.destroy
    redirect_to event_path(event)

  end

  def edit
    authorize @comment

  end

   private

  def comment_params
    params.require(:comment).permit(:comment, :event_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
