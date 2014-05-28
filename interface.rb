require './lib/term'

def main_menu
  puts "Press 't' to add a new term"
  puts "Press 'l' to list all the terms"
  puts "Press 'e' to edit a term"
  puts "Press 's' to search for a term"
  puts "Press 'x' to exit"

  main_choice = gets.chomp

  if main_choice == 't'
    add_new_term
  elsif main_choice == 'l'
    list_terms
  elsif main_choice == 'e'
    edit_term
  elsif main_choice == 's'
    search_term
  elsif main_choice == 'x'
    "Goodbye"
  else
    puts "Please enter a valid option"
    main_menu
  end
end

def add_new_term
  puts "Enter the word you would like to define"
  word = gets.chomp
  puts "Enter the definition for your word"
  definition = gets.chomp
  new_term = Term.create(word, definition)
  puts new_term.word +  " has been added to the list"
  main_menu
end

def list_terms
  puts "Here are all your terms and their definitions"
  Term.all.each do |term|
    puts "#{term.id}) " + term.word.red + "\n    " + term.definition.blue
  end
  puts "\n"
  main_menu
end

def edit_term
  puts "\n"
  Term.all.each do |term|
    puts "#{term.id}) " + term.word
  end
  puts "Choose term to edit"
  term_id = gets.chomp.to_i
  current_term = Term.all[term_id-1]
  puts current_term.word + "\n    " + current_term.definition
  puts "Enter 'w' to edit word. Enter 'd' to edit definition. \n"
  selection = gets.chomp
  if selection == 'w'
    puts "Enter the new word: \n"
    new_word = gets.chomp
    current_term.edit_term_word(new_word)
    puts "Word changed \n"
  elsif selection == 'd'
    puts "Enter the new definition: \n"
    new_definition = gets.chomp
    current_term.edit_term_definition(new_definition)
    puts "Definition changed \n"
  end
  list_terms
end

def search_term
  puts "Watchu want?"
  search_word = gets.chomp
  searched_term = Term.search(search_word)
  puts "\nHERE'S YOUR WORD, B*TCH! \n".magenta
  puts searched_term.word + "\n    " + searched_term.definition
  puts "\n"
  main_menu
end

main_menu
