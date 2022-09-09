#!/usr/bin/env ruby
require File.expand_path('../../../config/environment', __FILE__)
require 'word_generator'

generator = WordGenerator.new
User.active.each do |user|
  puts "Current user: #{user.name}"
  puts "Current sentence: #{user.last_sentence.try(:sentence)}"

  unacceptable = true
  sentence = ""
  while unacceptable
    word = generator.call

    puts "Current temporary sentence: #{sentence}"
    puts "What do you want to do? a/r/g/c (add, retry, generate, cancel)\n #{word}"

    # Command line user decides if this sentence makes sense
    response = gets.strip

    # Respond accordingly
    case response
    when 'a'
      puts "adding this word to the sentence"
      sentence << " #{word}"
      next
    when 'r'
      puts 'retrying....'
      next
    when 'g'
      sentence << " #{word}"
      puts "The sentence will be: #{sentence}"
      Sentence.create(sentence:, user:)
      unacceptable = false
    when 'c'
      puts 'Skipping...'
      unacceptable = false
    else
      puts 'Something went wrong, retrying...'
      next
    end
  end
end
