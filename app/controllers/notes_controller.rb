class NotesController < ApplicationController
    before_action :get_user
    def new
        if params[:id]
            @note = @user.notes.find(params[:id])
            @note.rating = nil
            @note.attitude = nil
        else
            @note = @user.notes.new
        end
        @unique_productions = Production.all
    end
    
    def new_musician
        id = params[:id]
        @note = @user.notes.find(id)
    end
    
    def new_actor
        id = params[:id]
        @note = @user.notes.find(id)
    end
    
    def index
        @notes = @user.notes.all
    end
    
    def show
        @note = @user.notes.find(params[:id])
        @note_fields = note_fields
    end
    
    def edit
        @note = @user.notes.find(params[:id])
        @note_fields = note_fields
    end
    
    def update
        @note = @user.notes.find(params[:id])
        if @note.update(note_params)
            flash[:notice] = "#{@note.name} was successfully updated."
            redirect_to note_path(@note)
        else
            render 'edit'
        end
    end
    
    def create
        @note = @user.notes.new(note_params)
        if @note.save
            if @note.role == "Musician"
                redirect_to notes_new_musician_path(:id => @note.id)
            elsif @note.role == "Actor/Actress"
                redirect_to notes_new_actor_path(:id => @note.id)
            else
                redirect_to note_path(@note)
            end
        else
            flash[:notice] = "Missing name or production."
            redirect_to new_note_path
        end
    end
    
    def create_musician
        id = params[:id]
        @note = @user.notes.find(id)
        @note.update(note_params)

        redirect_to note_path(@note)
    end
    
    def create_actor
        id = params[:id]
        @note = @user.notes.find(id)
        @note.update(note_params)
        @note.save
        
        redirect_to note_path(@note)
    end
    
    
    def destroy
        @note = @user.notes.find(params[:id])
        @note.destroy
        flash[:notice] = "Note was deleted."
        redirect_to notes_path
    end
    
    def home
        @unique_productions = Production.all
        
    end
    def search
        @search_result = @user.notes.all
        if note_params[:name] != ""
            @search_result = @search_result.where("name = ?", note_params[:name])
        end
        
        if note_params[:production_id] != ""
            @search_result = @search_result.where("production_id = ?", note_params[:production_id])
        end
        
        if note_params[:role] != ""
            @search_result = @search_result.where("role = ?", note_params[:role])
        end
        
    end
    
    private
        def note_params
            params.require(:note).permit(:name, :production_id, :role, :description, :rating, :attitude, :star_sub, :musical_maturity, :reads_music, :harmony_singer, :instrument)
        end
        
        def note_fields
            {"attitude"=>{4=>"Brings joy to every rehearsal", 3=>"Professional and easy to work with", 2=>"Sometimes needs managing", 1=>"Difficult"}, "rating"=>{5=>"Yes!!", 4=>"Yes", 3=>"I won't cast them, but I won't object", 2=>"Rather not", 1=>"Definitely not"}, "star_sub"=>{true=>"Yes", false=>"No"},"reads_music"=>{3=>"Very well", 2=>"Can work on their own, but not sightread", 1=>"No"}, "harmony_singer"=>{4=>"Pro/Veteran", 3=>"Solidly teachable", 2=>"Teachable but weak", 1=>"No"}, "musical_maturity"=>{4=>"Pro/Veteran", 3=>"Solid", 2=>"A few weaknesses but fine", 1=>"Green"}}
        end
        
        def get_user
            @user = User.find(session[:user_id])
        end
        
        
end
