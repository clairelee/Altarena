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
    Note.create(note)
  end
end
    