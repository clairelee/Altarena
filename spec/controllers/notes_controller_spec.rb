require 'spec_helper'

describe NotesController do
    describe 'creating a new note' do
        it 'should successfully add a new note for fields on first page and redirect to page with musician specific fields' do
            @note = double("Note")
            allow(@note).to receive(:role) {"Musician"}
            allow(@note).to receive(:id) {1}
            expect(Note).to receive(:create!).with("name" => "Dummy Name", "production" => "Dummy Production", "role" => "Musician", "rating" => "5")
            Note.stub(:create!).and_return(@note)
            
            post :create, :note => {:name => "Dummy Name", :production => "Dummy Production", :role => "Musician", :rating => 5}
            response.should redirect_to notes_new_musician_path(:id => 1)
        end
        
        it 'should successfully add a new note for fields on first page and redirect to page with actor specific fields' do
            @note = double("Note")
            allow(@note).to receive(:role) {"Actor"}
            allow(@note).to receive(:id) {2}
            expect(Note).to receive(:create!).with("name" => "Dummy Name", "production" => "Dummy Production", "role" => "Actor", "rating" => "5")
            Note.stub(:create!).and_return(@note)
            
            post :create, :note => {:name => "Dummy Name", :production => "Dummy Production", :role => "Actor", :rating => 5}
            response.should redirect_to notes_new_actor_path(:id => 2)
            
        end
        
        it 'should successfully add a new note for musician specific fields in the db' do
            @note = double("Note")
            expect(Note).to receive(:find).with("1")
            Note.stub(:find).and_return(@note)
            expect(@note).to receive(:update).with("star_sub" => true, "musical_maturity" => "4")
            expect(@note).to receive(:save)
            
            post :create_musician, :note => {:star_sub => true, :musical_maturity => 4}, :id => 1
            response.should redirect_to note_path(@note)
        end
        
        it 'should successfully add a new note for actor/actress specific fields in the db' do
            @note = double("Note")
            expect(Note).to receive(:find).with("2")
            Note.stub(:find).and_return(@note)
            expect(@note).to receive(:update).with("reads_music" => "3", "harmony_singer" => "4")
            expect(@note).to receive(:save)
            
            post :create_actor, :note => {:reads_music => 3, :harmony_singer => 4}, :id => 2
            response.should redirect_to note_path(@note)
        end
    end
    
    describe 'deleting an existing note' do
        it 'should successfully remove a note from the db' do
            @note = double("Note")
            expect(Note).to receive(:find).with("1")
            Note.stub(:find).and_return(@note)
            expect(@note).to receive(:destroy)
            
            post :destroy, :id => 1
            response.should redirect_to notes_path
        end
    end
    
    describe 'editing an existing note' do
        it 'should return a form to edit the note' do
            expect(Note).to receive(:find).with("1")
            
            get :edit, :id => 1
        end
        
        it 'should update the note based on new information entered' do
            @note = double("Note")
            allow(@note).to receive(:update) {true}
            expect(Note).to receive(:find).with("1")
            Note.stub(:find).and_return(@note)
            expect(@note).to receive(:update).with("name" => "Dummy Name", "production" => "Dummy Production", "role" => "Musician", "rating" => "5", "star_sub" => true, "musical_maturity" => "4")
            expect(@note).to receive(:name)
            
            post :update, :note => {:name => "Dummy Name", :production => "Dummy Production", :role => "Musician", :rating => 5, :star_sub => true, :musical_maturity => 4}, :id => 1
            response.should redirect_to note_path(@note)
        end
    end
end