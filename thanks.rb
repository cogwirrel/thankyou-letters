#!/usr/bin/env ruby

# Import the configuration file
require './config.rb'

# Return the same number of kisses as capital letters in string
# Good for list of first names eg. 'Ron, Hermione, Ginny' for 1 kiss each
def kisses(to)
  'x' * to.gsub(/[^A-Z]/, '').length
end

# Delete random element from array and return result
def randRemove(array)
  array.delete array.sample
end

adjectives = ['lovely', 'amazing', 'fantastic', 'brilliant', 'marvellous', 'superb', 'great', 'fun', 'delightful', 'awesome']
excitement = ["can't wait to", 'am excited to', 'am thrilled to', 'think I will', 'have decided to', 'am going to']
thinking = ['quite tempted to', 'thinking that I might']
thankyous = ['thank you', 'I am very grateful', 'thank you so much']

# Write a letter for every present
presents().each do |present|
  letter = "Dear #{present['to']},\n\n"
  gifts = present['gifts']

  # Copy the arrays so that we can remove elements care-free
  thanks = Array.new(thankyous)
  adjs = Array.new(adjectives)
  
  # Thank for every gift in the present
  gifts.each do |gift|
    letter += "#{randRemove(thanks).capitalize} for my #{randRemove(adjs)} #{gift['gift']}"

    if rand(2) == 0
      # Add a little flourish every now and then
      letter += ", "
      letter += gift['gift'][-1] == 's' ? "they're" : "it's"
      letter += " #{randRemove(adjs)}"
    end

    letter += "! I #{excitement.sample} #{gift['uses'][0]}. I am also #{thinking.sample} #{gift['uses'][1]}.\n\n"
  end

  # A bit of small talk
  letter += "It was #{randRemove(adjs)} to see you #{present['last_seen']}, I really enjoyed #{present['did']}.\n\n"
  letter += "I hope you have a #{randRemove(adjs)} new year, and I look forward to seeing you soon.\n\n"

  # Finish the letter off
  letter += "Lots of love from,\n\n#{from()}\n"
  letter += kisses present['to']
  letter += "\n\n"

  print letter
end