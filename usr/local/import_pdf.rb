#!/usr/bin/env ruby
require File.expand_path("../../../config/environment", __FILE__)
require 'pry'

unless (book_pdf = ARGV[0]) && File.file?(book_pdf)
  STDERR.puts("usage: #{$0} <book-pdf>")
  exit 1
end

reader = PDF::Reader.new(book_pdf)

info = reader.info
book = Book.create(author: info[:Author], title: info[:Title])

reader.pages.each do |the_page|
  page = Page.create(book: book, page_number: the_page.number)

  words = the_page.text.split(/\W+/).reject(&:empty?)
  words.each do |the_word|
    Word.create(word: the_word, page: page)
  end
end
