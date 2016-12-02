# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

instruments = Instrument.create([{ name: 'Violin' }, { name: 'Percussion'}, { name: 'Guitar' }, {name: 'Piano/Keyboards'}, {name: 'Harp'}, {name: 'Viola'}, {name: 'Cello'}, {name: 'Acoustic Bass'}, {name: 'Fender Bass'}, {name: 'Electric Guitar'}, {name: 'Flamenco Guitar'}, {name: 'Banjo'}, {name: 'Soprano Sax'}, {name: 'Alto Sax'}, {name: 'Tenor Sax'}, {name: 'Baritone Sax'}, {name: 'Bass Sax'}, {name: 'Oboe'}, {name: 'English Horn'}, {name: 'Bassoon'}, {name: 'Clarinet'}, {name: 'Alto Clarinet'}, {name: 'Bass Clarinet'}, {name: 'Flute'}, {name: 'Piccolo'}, {name: 'Alto Flute'}, {name: 'Bass Flute'}, {name: 'Harmonica'}, {name: 'Accordion'}, {name: 'Trumpet/Flugelhorn'}, {name: 'Horn'}, {name: 'Trombone'}, {name: 'Bass Trombone'}, {name: 'Tuba'}])

# profile = Profile.create(:name => "Ray Charles", :photo_url => "http://www.mtv.com/crop-images/2013/09/04/Ray%20Charles%20GI.jpg", :resume_url => "")
#     profile.save
# profile = Profile.create(:name => "Eric Walbridge", :photo_url => "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAARRAAAAJDE5NzQyM2Q4LWQyNzUtNDU2OC1iMDJmLTg0M2U5ZjE1MjQxOQ.jpg", :resume_url => "")
#     profile.save
# profile = Profile.create(:name => "Buddy Rich", :photo_url => "http://cdn-x.drummerworld.com/pics/drumpics34/buddyrich500999.jpg", :resume_url => "")
#     profile.save

# production1 = Production.create(:name => "Lion King 1.5", :company => "Disney", :opening_date => "June 23rd, 2017")
#     production1.save
# production2 = Production.create(:name => "The Jungle Book", :company => "Disney", :opening_date => "May 4th, 2017")
#     production2.save

# User.all.each do |user|
    
#     # defaultNotes = [{:name => 'Ray Charles', :production_id => 1, :role => 'Actor/Actress',
#     #                 :description => 'Not the best singer, but can act', :rating => 4, :attitude => 2, 
#     #                 :star_sub => false, :musical_maturity => 1, :reads_music => 1, :harmony_singer => 1,
#     #                 :profile => profile},
#     #                 {:name => 'Ray Charles', :production_id => 2, :role => 'Musician',
#     #                 :description => 'Amazing musician, can pick up an learn music at a rapid pace', :rating => 5, :attitude => 4,
#     #                 :star_sub => true, :musical_maturity => 4, :reads_music => 3, :harmony_singer => 4,
#     #                 :profile => profile}]

                    
#     # defaultNotes = [{:name => 'Eric Walbridge', :production_id => 1, :role => 'Actor/Actress',
#     #             :description => 'Eric is extremeley responsive to constructive criticism', :rating => 4, :attitude => 3,
#     #             :star_sub => true, :musical_maturity => 3, :reads_music => 1, :harmony_singer => 2,
#     #             :profile => profile},
#     #             {:name => 'Eric Walbridge', :production_id => 2, :role => 'Musician',
#     #             :description => 'Eric often gets caught up with the small details, which hinders the group at times', :rating => 3, :attitude => 4,
#     #             :star_sub => false, :musical_maturity => 2, :reads_music => 3, :harmony_singer => 1,
#     #             :profile => profile}]

    
#     defaultNotes = [{:name => 'Buddy Rich', :production_id => 1, :role => 'Musician',
#                     :description => 'Buddy is an amazing drummer, never have any problems with him', :rating => 5, :attitude => 4,
#                     :star_sub => true, :musical_maturity => 4, :reads_music => 3, :harmony_singer => 1,
#                     :profile => profile},
#                     {:name => 'Buddy Rich', :production_id => 2, :role => 'Musician',
#                     :description => 'Buddy is not only a great musician, but he is also a pleasure to work with', :rating => 5, :attitude => 4,
#                     :star_sub => true, :musical_maturity => 4, :reads_music => 3, :harmony_singer => 1,
#                     :profile => profile}]
                    
#     defaultNotes.each do |note|
#       note = user.new_note(note)
#       note.save!
#     #   new_notes_instrument = NotesInstrument.create(:note_id => "#{note.id}", :instrument_id => "4")
#     #   new_notes_instrument = NotesInstrument.create(:note_id => "#{note.id}", :instrument_id => "3")
#       new_notes_instrument = NotesInstrument.create(:note_id => "#{note.id}", :instrument_id => "2")
#     end
#     user.save
# end    