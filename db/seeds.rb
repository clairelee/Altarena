# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# instruments = Instrument.create([{ name: 'Violin' }, { name: 'Percussion'}, { name: 'Guitar' }, {name: 'Piano/Keyboards'}, {name: 'Harp'}, {name: 'Viola'}, {name: 'Cello'}, {name: 'Acoustic Bass'}, {name: 'Fender Bass'}, {name: 'Electric Guitar'}, {name: 'Flamenco Guitar'}, {name: 'Banjo'}, {name: 'Soprano Sax'}, {name: 'Alto Sax'}, {name: 'Tenor Sax'}, {name: 'Baritone Sax'}, {name: 'Bass Sax'}, {name: 'Oboe'}, {name: 'English Horn'}, {name: 'Bassoon'}, {name: 'Clarinet'}, {name: 'Alto Clarinet'}, {name: 'Bass Clarinet'}, {name: 'Flute'}, {name: 'Piccolo'}, {name: 'Alto Flute'}, {name: 'Bass Flute'}, {name: 'Harmonica'}, {name: 'Accordion'}, {name: 'Trumpet/Flugelhorn'}, {name: 'Horn'}, {name: 'Trombone'}, {name: 'Bass Trombone'}, {name: 'Tuba'}])

profile = Profile.create(:name => "Eric Walbridge", :photo_url => "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAARRAAAAJDE5NzQyM2Q4LWQyNzUtNDU2OC1iMDJmLTg0M2U5ZjE1MjQxOQ.jpg", :resume_url => "")
    profile.save
production1 = Production.create(:name => "Lion King 1.5", :company => "Disney", :opening_date => "June 23rd, 2017")
    production1.save
production2 = Production.create(:name => "The Jungle Book", :company => "Disney", :opening_date => "May 4th, 2017")
    production2.save

User.all.each do |user|
    
    defaultNotes = [{:name => 'Eric Walbridge', :production_id => 1, :role => 'Actor/Actress',
                    :description => 'not the best singer, but can act', :rating => 4, :attitude => 2, 
                    :star_sub => false, :musical_maturity => 1, :reads_music => 1, :harmony_singer => 1,
                    :profile => profile},
                    {:name => 'Eric Walbridge', :production_id => 2, :role => 'Musician',
                    :description => 'amazing musician, can pick up an learn music at a rapid pace', :rating => 5, :attitude => 4,
                    :star_sub => true, :musical_maturity => 4, :reads_music => 3, :harmony_singer => 4,
                    :profile => profile}]
    
    defaultNotes.each do |note|
      note = user.new_note(note)
      note.save!
      new_notes_instrument = NotesInstrument.create(:note_id => "#{note.id}", :instrument_id => "3")
    end
    user.save
end    

    # default_notes = [
    #     { 
    #       name: "Billy",
    #       production_id: "Lion King",
    #       role: "Musician",
    #       instruments: "Bass Flute",
    #       description: "sight reading",
    #       rating: 9,
    #       attitude: "Brings joy to every rehearsal",
    #       star_sub: "Yes",
    #       musical_maturity: "Solid",
    #       reads_music: true,
    #       harmony_singer: true,
    #       profile_id: profile.id
    #     }
    # ]

    # defaultNotes.each do |note|
    #   puts note["name"]
    #   user.new_note(note)
    # end
    # user.save
    # user.all_notes.each do |note|
    #   puts "Here is a note " + note.name
    # end