class NotesController < ApplicationController
    def new
    end
    
    def index
        @notes = Note.all
    end
    
    def show
        @note = Note.find(params[:id])
    end
    
    def create
        @note = Note.new(note_params)
        puts("sup dude")
        @note.save
        redirect_to note_path(note)
    end
    
    private
        def note_params
            params.require(:note).permit(:name, :role, :description)
        end
        
    def destroy
        @note = Note.find(params[:id])
        @note.destroy
        flash[:notice] = "Note was deleted."
        redirect_to notes_path
    end
end
