#!/usr/bin/env ruby
require File.expand_path('../../../config/environment', __FILE__)
require 'text_synth_generator'

User.active.each do |user|
  sentence = user.last_sentence
  unacceptable = true
  generator = TextSynthGenerator.new(sentence.sentence)

  while unacceptable

    paragraph = generator.call

    puts "sentence: #{sentence.sentence}\n Paragraph: #{paragraph}\n Does this paragraph work? y/n/s (yes, no, skip)"

    # Command line user decides if this sentence makes sense
    response = gets.strip

    # Respond accordingly
    case response
    when 'y'
      TextSynth.create(text: paragraph, sentence:)
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
