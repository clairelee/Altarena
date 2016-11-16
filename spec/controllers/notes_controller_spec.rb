require 'spec_helper'

describe NotesController do
    before(:each) do
        @note = double("Note")
        @user = double("User")
        @user.stub(:find_note).and_return(@note)
        @user.stub(:new_note).and_return(@note)
        User.stub(:find_by_id).and_return(@user)
    end
    
    describe 'creating a new note' do
        it 'should direct user to create notes page' do
            expect(@user).to receive(:find_note)
            expect(@note).to receive(:rating=)
            expect(@note).to receive(:attitude=)
            
            get :new, :id => 1
        end
        it 'should successfully add a new note for fields on first page and redirect to page with musician specific fields' do
            @note.stub(:save).and_return(true)
            expect(@user).to receive(:new_note)
            allow(@note).to receive(:role) {"Musician"}
            allow(@note).to receive(:id) {1}
            expect(@note).to receive(:save)
            
            post :create, :note => {:name => "Dummy Name", :production => "Dummy Production", :role => "Musician", :rating => 5}
            response.should redirect_to notes_new_musician_path(:id => 1)
        end
        
        it 'should successfully add a new note for fields on first page and redirect to page with actor specific fields' do
            @note.stub(:save).and_return(true)
            expect(@user).to receive(:new_note)
            allow(@note).to receive(:role) {"Actor/Actress"}
            allow(@note).to receive(:id) {2}
            expect(@note).to receive(:save)
            Note.stub(:save).and_return(true)
            
            post :create, :note => {:name => "Dummy Name", :production => "Dummy Production", :role => "Actor", :rating => 5}
            response.should redirect_to notes_new_actor_path(:id => 2)
            
        end
        
        it 'should successfully add a new note for musician specific fields in the db' do
            @note.stub(:save).and_return(true)
            expect(@user).to receive(:find_note).with("1")
            expect(@note).to receive(:update).with("star_sub" => true, "musical_maturity" => "4")
            expect(@note).to receive(:save)
            
            post :create_musician, :note => {:star_sub => true, :musical_maturity => 4}, :id => 1
            response.should redirect_to note_path(@note)
        end
        
        it 'should successfully add a new note for actor/actress specific fields in the db' do
            @note.stub(:save).and_return(true)
            expect(@user).to receive(:find_note).with("2")
            expect(@note).to receive(:update).with("reads_music" => "3", "harmony_singer" => "4")
            expect(@note).to receive(:save)
            
            post :create_actor, :note => {:reads_music => 3, :harmony_singer => 4}, :id => 2
            response.should redirect_to note_path(@note)
        end
        
        it 'should render create note page again if Name or Production not specified' do
            @note.stub(:save).and_return(false)
            
            post :create, :note => {:role => "Musician"}
            response.should redirect_to new_note_path
        end
    end
    
    describe 'deleting an existing note' do
        it 'should successfully remove a note from the db' do
            expect(@user).to receive(:find_note)
            @note.stub(:destroy).and_return(true)
            expect(@note).to receive(:destroy)
            
            post :destroy, :id => 1
            response.should redirect_to notes_path
        end
    end
    
    describe 'editing an existing note' do
        it 'should return a form to edit the note' do
            expect(@user).to receive(:find_note)
            get :edit, :id => 1
        end
        
        it 'should update the note based on new information entered' do
            expect(@user).to receive(:find_note)
            allow(@note).to receive(:update) {true}
            expect(@note).to receive(:update).with("name" => "Dummy Name", "production_id" => "1", "role" => "Musician", "rating" => "5", "star_sub" => true, "musical_maturity" => "4")
            expect(@note).to receive(:name)
            
            post :update, :note => {:name => "Dummy Name", :production_id => "1", :role => "Musician", :rating => 5, :star_sub => true, :musical_maturity => 4}, :id => 1
            response.should redirect_to note_path(@note)
        end
    end
    
    describe 'searching through all notes' do
        it 'should filter through notes using each of the categories specified' do
            @search_result = double("Search Result")
            @user.stub(:all_notes).and_return(@search_result)
            @search_result.stub(:where).and_return(@search_result)
            
            expect(@search_result).to receive(:where).with("name = ?", "dummy_name")
            expect(@search_result).to receive(:where).with("production_id = ?", "dummy_id")
            expect(@search_result).to receive(:where).with("role = ?", "dummy_role")
            
            post :search, :note => {:name => "dummy_name", :production_id => "dummy_id", :role => "dummy_role"}
        end
    end
end