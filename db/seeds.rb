# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Instrument.create([{ name: 'Violin' }, { name: 'Percussion'}, { name: 'Guitar' }, {name: 'Piano/Keyboards'}, {name: 'Harp'}, {name: 'Viola'}, {name: 'Cello'}, {name: 'Acoustic Bass'}, {name: 'Fender Bass'}, {name: 'Electric Guitar'}, {name: 'Flamenco Guitar'}, {name: 'Banjo'}, {name: 'Soprano Sax'}, {name: 'Alto Sax'}, {name: 'Tenor Sax'}, {name: 'Baritone Sax'}, {name: 'Bass Sax'}, {name: 'Oboe'}, {name: 'English Horn'}, {name: 'Bassoon'}, {name: 'Clarinet'}, {name: 'Alto Clarinet'}, {name: 'Bass Clarinet'}, {name: 'Flute'}, {name: 'Piccolo'}, {name: 'Alto Flute'}, {name: 'Bass Flute'}, {name: 'Harmonica'}, {name: 'Accordion'}, {name: 'Trumpet/Flugelhorn'}, {name: 'Horn'}, {name: 'Trombone'}, {name: 'Bass Trombone'}, {name: 'Tuba'}])

# profile = Profile.create(:name => "Billy")
#     profile.save
#     default_notes = [
#         { 
#           name: "Billy",
#           production_id: "Lion King",
#           role: "hi",
#           description: "hi",
#           rating: 9,
#           attitude: "hello",
#           star_sub: true,
#           musical_maturity: 9,
#           reads_music: true,
#           harmony_singer: true,
#           profile_id: profile.id
#         }
#     ]
#     default_notes.each do |note|
#       puts note["name"]
#       user.new_note(note)
#     end
#     user.save
#     user.all_notes.each do |note|
#       puts "Here is a note " + note.name
#     end