Given /^the endorsements are filled$/ do
    pending
end

Given /^a dummy (.*) exists$/ do |model|
    pending
end

Given /the following notes exist/ do |notes_table|
  notes_table.hashes.each do |note|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Note.create!(note)
  end
end
    
When /I (un)?check the following instruments: (.*)/ do |uncheck, instrument_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  instrument_list.split(', ').each { |instrument|
    if uncheck
      uncheck("notes[#{instrument}]")
    else
      check("notes[#{instrument}]")
    end
  }
end