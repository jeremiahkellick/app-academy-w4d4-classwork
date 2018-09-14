class NotesController < ApplicationController
  before_action :must_be_logged_in

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.track_id = params[:track_id]
    if @note.save
      redirect_to track_url(params[:track_id])
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(params[:track_id])
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.user.id == current_user.id
      @note.destroy
      redirect_to track_url(@note.track)
    else
      render plain: "403 Forbidden", status: 403
    end
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
