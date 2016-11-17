# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the Login page$/
      pending
    when /^the Notes page$/
      '/notes'
    when /^the Create notes page$/
      '/notes/new'
    when /^the new actor notes page$/
      '/notes_new_actor'
    when /^the new musician notes page$/
      '/notes_new_musician'
    when /^the view notes page for "([^"]+)"$/
      note = Note.find_by_name($1)
      note_path(note.id)
    when /^the edit notes page for "([^"]+)"$/
      note = Note.find_by_name($1)
      edit_note_path(note.id)
    when /^the Notes Home page$/
      '/notes_home'
    when /^the Create productions page$/
      '/productions/new'
    when /^the Create Profile page$/
      pending
    when /^the User Record page$/
      pending
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
