class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @report = Report.find(params[:report_id])
    @comment = @report.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @report, notice: 'Commentaire créé'
    else
      redirect_to @report, alert: 'Erreur lors de la création du commentaire'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @report = @comment.report
    @comment.destroy
    redirect_to @report, notice: 'Commentaire effacé.'
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
