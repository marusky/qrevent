class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  private 

  def require_current_user
    if current_user != @event.user
      # TODO notice!
      redirect_to :root, notice: 'You cannot edit an event that is not yours.'
    end
  end

  def set_event
    # params[:id].present? ? 
    if params[:id].present?
      @event = Event.find(params[:id])
    elsif params[:event_id].present?
      @event = Event.find(params[:event_id])
    else 
      not_found
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :enterprise])
  end

end
