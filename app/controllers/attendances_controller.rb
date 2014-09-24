class AttendancesController < ApplicationController
  before_filter :ensure_logged_in

  def new
    a = Attendance.new(attended_event_id: params[:event_id].to_i, attendee_id: current_user.id)
    a.save
    redirect_to event_path(params[:event_id])
  end

  def destroy
    Attendance.where(attended_event_id: params[:event_id].to_i, attendee_id: current_user.id).first.destroy
    redirect_to event_path(params[:event_id])
  end  

private
  def ensure_logged_in
    if !logged_in?
      redirect_to login_path
    end
  end
end
