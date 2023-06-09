module ApplicationHelper

  private

  def authenticate_user
    unless current_user
      flash[:alert] = "Merci de vous connecter pour pouvoir mettre des likes."
      redirect_to new_user_session_path
    end
  end

  def check_if_admin
    unless current_user&.is_admin
      flash[:alert] = "Action réservée aux administrateurs !"
      redirect_to root_path
    end
  end

  def check_if_admin_or_creator
    if Report.find(params['id']).status == 0
      unless current_user&.is_admin || current_user&.id == Report.find(params['id']).user_id
        flash[:alert] = "Cet évènement n'est pas encore validé !"
        redirect_to root_path
      end
    end
  end

end
