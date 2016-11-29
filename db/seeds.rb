# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

instruments = Instrument.create([{ name: 'Violin' }, { name: 'Percussion'}, { name: 'Guitar' }, {name: 'Piano/Keyboards'}, {name: 'Harp'}, {name: 'Viola'}, {name: 'Cello'}, {name: 'Acoustic Bass'}, {name: 'Fender Bass'}, {name: 'Electric Guitar'}, {name: 'Flamenco Guitar'}, {name: 'Banjo'}, {name: 'Soprano Sax'}, {name: 'Alto Sax'}, {name: 'Tenor Sax'}, {name: 'Baritone Sax'}, {name: 'Bass Sax'}, {name: 'Oboe'}, {name: 'English Horn'}, {name: 'Bassoon'}, {name: 'Clarinet'}, {name: 'Alto Clarinet'}, {name: 'Bass Clarinet'}, {name: 'Flute'}, {name: 'Piccolo'}, {name: 'Alto Flute'}, {name: 'Bass Flute'}, {name: 'Harmonica'}, {name: 'Accordion'}, {name: 'Trumpet/Flugelhorn'}, {name: 'Horn'}, {name: 'Trombone'}, {name: 'Bass Trombone'}, {name: 'Tuba'}])

profile = Profile.create(:name => "Ronald")
    profile.save
production = Production.create(:name => "Lion King", :company => "Disney", :opening_date => "June 1st, 1995")
    production.save

User.all.each do |user|
    
    defaultNotes = [{:name => 'Ronald', :production => production, :role => 'Musician',
                    :description => 'sight reading', :rating => '9', :attitude => 'Brings joy to every rehearsal', 
                    :star_sub => "Yes", :musical_maturity => 'Solid', :reads_music => true, :harmony_singer => true,
                    :profile => profile}]
    
    defaultNotes.each do |note|
      note = user.new_note(note)
      note.save
      ni = note.notes_instruments.new(:note => note, :instrument => instruments.sample)
      ni.save
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