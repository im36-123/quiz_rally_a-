# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"
CSV.foreach('db/answers.csv') do |row|
  Answer.create(:id => row[0], :choice_id => row[1], :explanation => row[4])
end
CSV.foreach('db/choices.csv') do |row|
  Choice.create(:id => row[0], :quiz_id => row[1], :choice_txt => row[2], :correct_flag => row[5], :choice_count => row[6])
end
CSV.foreach('db/quizzes.csv') do |row|
  Quiz.create(:id => row[0], :quiz_num => row[1], :quiz_txt => row[2], :quiz_img_path => row[3], :count => row[4])
end
CSV.foreach('db/phones.csv') do |row|
  Phone.create(:id => row[0], :identification => row[1], :quiz_id => row[2])
end
CSV.foreach('db/participants_camellia.csv') do |row|
  Participant.create(:id => row[0], :tag => row[1], :count => row[2])
end