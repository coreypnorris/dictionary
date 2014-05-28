require 'rspec'
require 'term'
require 'word'
require 'definition'

describe 'Term' do

  before do
   Term.clear
  end

  describe '.create' do
    it 'creates a new instance of the Term class and creates an instance of the Word class with new words in it' do
      test_term = Term.create
      test_term.add_word('hola','spanish')
      test_term.add_word('ciao','italian')
      test_term.should be_an_instance_of Term
      Term.all.length.should eq 1
      test_term.words.length.should eq 2
    end
  end
end

describe 'Word' do
  describe '.create' do
    it 'creates a new instace of the Word class' do
      test_term = Term.create
      test_term.add_word('hola','spanish')
      test_term.words[0].should be_an_instance_of Word
      test_term.words.length.should eq 1
    end
  end
  describe '.delete' do
    it 'Deletes the current word' do
      test_term = Term.create
      test_term.add_word('hola','spanish')
      test_term.remove_word('hola')
      test_term.words.length.should eq 0
    end
  end
end

describe 'Definition' do
  describe '.create' do
    it 'creates a new instace of the Word class' do
      test_term = Term.create
      test_term.add_definition('a common greeting', 'english')
      test_term.definitions.length.should eq 1
    end
  end

end



