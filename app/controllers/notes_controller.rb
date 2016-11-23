class NotesController < ApplicationController
    before_action :get_user
    def new
        if params[:id]
            @note = @user.find_note(params[:id])
            @note.rating = nil
            @note.attitude = nil
        else
            @note = @user.notes.new
        end
        @unique_productions = Production.all
        @instruments = Instrument.all
    end
    
    def new_musician
        id = params[:id]
        @note = @user.find_note(id)
    end
    
    def new_actor
        id = params[:id]
        @note = @user.find_note(id)
    end
    
    def index
        @notes = @user.all_notes
    end
    
    def show
        @note = @user.find_note(params[:id])
        @note_fields = note_fields
        
        @instruments = @note.get_instruments
    end
    
    def edit
        @note = @user.find_note(params[:id])
        @note_fields = note_fields
        @unique_productions = Production.all
    end
    
    def update
        @note = @user.find_note(params[:id])
        if @note.update(note_params)
            flash[:update_notice] = "#{@note.name} was successfully updated."
            redirect_to note_path(@note)
        else
            render 'edit'
        end
    end
    
    def create
        @note = @user.new_note(note_params)
    
        if @note.save
            
            instrument_ids = params[:instruments]
            if instrument_ids
                for id in instrument_ids do
                    @note.notes_instruments.create(:instrument_id => id)
                end
            end
        
            if @note.role == "Musician"
                redirect_to notes_new_musician_path(:id => @note.id)
            elsif @note.role == "Actor/Actress"
                redirect_to notes_new_actor_path(:id => @note.id)
            else
                redirect_to note_path(@note)
            end
        else
            flash[:create_notice] = "Missing name or production."
            redirect_to new_note_path
        end
    end
    
    def create_musician
        id = params[:id]
        @note = @user.find_note(id)
        @note.update(note_params)
        @note.save

        redirect_to note_path(@note)
    end
    
    def create_actor
        id = params[:id]
        @note = @user.find_note(id)
        @note.update(note_params)
        @note.save
        
        redirect_to note_path(@note)
    end
    
    
    def destroy
        @note = @user.find_note(params[:id])
        @note.destroy
        flash[:delete_notice] = "Note was deleted."
        redirect_to notes_path
    end
    
    def home
        @unique_productions = Production.all
        @instruments = Instrument.all
    end
    def search
        flash[:search_result_notice] = ""
        filtered_notes = @user.all_notes
        if note_params[:name] != ""
            filtered_notes = filtered_notes.where("lower(name) like ?", "%#{note_params[:name]}%")
            flash[:search_result_notice] += "Name: #{note_params[:name]}, "
        end
        
        if note_params[:role] != ""
            filtered_notes = filtered_notes.where("role = ?", note_params[:role])
            flash[:search_result_notice] += "Role: #{note_params[:role]}, "
        end
        
        if note_params[:production_id] != ""
            filtered_notes = filtered_notes.where("production_id = ?", note_params[:production_id])
            flash[:search_result_notice] += "Production: #{Production.find_by_id(note_params[:production_id]).name}, "
        end
        
        if params[:instruments]
            @search_result = [] 
            for note in filtered_notes do
                instrument_ids = note.get_instrument_ids
                plays_all_instruments = (params[:instruments] - instrument_ids).empty?
                
                if plays_all_instruments
                    @search_result << note
                end
            end
            
            instruments = Instrument.get_instruments_by_ids(params[:instruments])
            flash[:search_result_notice] += "Instruments: #{instruments}, "
        else 
            @search_result = filtered_notes
        end
        
        if flash[:search_result_notice] != ""
            flash[:search_result_notice] = "Notes with " + flash[:search_result_notice]
            flash[:search_result_notice] = flash[:search_result_notice][0..-3]
        end
    end
    
    private
        def note_params
            params.require(:note).permit(:name, :production_id, :role, :description, :rating, :attitude, :star_sub, :musical_maturity, :reads_music, :harmony_singer)
        end
        
        def note_fields
            {"attitude"=>{4=>"Brings joy to every rehearsal", 3=>"Professional and easy to work with", 2=>"Sometimes needs managing", 1=>"Difficult"}, "rating"=>{5=>"Yes!!", 4=>"Yes", 3=>"I won't cast them, but I won't object", 2=>"Rather not", 1=>"Definitely not"}, "star_sub"=>{true=>"Yes", false=>"No"},"reads_music"=>{3=>"Very well", 2=>"Can work on their own, but not sightread", 1=>"No"}, "harmony_singer"=>{4=>"Pro/Veteran", 3=>"Solidly teachable", 2=>"Teachable but weak", 1=>"No"}, "musical_maturity"=>{4=>"Pro/Veteran", 3=>"Solid", 2=>"A few weaknesses but fine", 1=>"Green"}}
        end
        
        def get_user
            @user = User.find_by_id(session[:user_id])
        end
        
        
end
