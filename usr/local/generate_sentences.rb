#!/usr/bin/env ruby
require File.expand_path('../../../config/environment', __FILE__)
require 'sentence_generator'

generator = SentenceGenerator.new
User.active.each do |user|
  puts "Current user: #{user.name}"
  puts "Current sentence: #{user.last_sentence.try(:sentence)}"

  unacceptable = true
  while unacceptable
    sentence = generator.call

    puts "Does this sentence make sense? y/n/s (yes, no, skip)\n #{sentence}"

    # Command line user decides if this sentence makes sense
    response = gets.strip

    # Respond accordingly
    case response
    when 'y'
      Sentence.create(sentence:, user:)
      unacceptable = false
    when 'n'
      puts 'retrying....'
      next
    when 's'
      puts 'Skipping...'
      unacceptable = false
    else
      puts 'Something went wrong, retrying...'
      next
    end
  end
end
