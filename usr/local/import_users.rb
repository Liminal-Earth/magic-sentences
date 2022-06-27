#!/usr/bin/env ruby
require File.expand_path("../../../config/environment", __FILE__)
require 'pry'
require 'csv'

unless (users_csv = ARGV[0]) && File.file?(users_csv)
  STDERR.puts("usage: #{$0} <users-csv>")
  exit 1
end

CSV.foreach(users_csv) do |row|
  name = row[0]
  email = row[1]
  User.create(name: name, email: email, active: true)
end
