class NotesController < ApplicationController
  before_action :set_note, except: [:new, :create]
  def new
    @note = Note.new
  end

  def create
    # debugger
    @note = Note.create(notes_params)
    @note.user_id = current_user.id
    @note.track_id = params[:track_id]
    if @note.save
      flash[:notice] = "Note successfully created"
      redirect_to track_url(@note.track_id)
    else
      flash[:notice] = "Couldn't write a note"
      redirect_to track_url(@note.track_id)
    end
  end

  def destroy
    if current_user.id != @note.user_id
      flash[:notice] = 'You are not my owner'
      redirect_to track_url(params[:track_id])
    else
      @note.destroy
      redirect_to track_url(params[:track_id])
    end

  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def notes_params
    params.require(:note).permit(:body)
  end
end
