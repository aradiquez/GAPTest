namespace :db do
  namespace :populate do
    desc "Populate DB with testing users"
    task seed: :environment do
      20.times do |i|
        puts "Adding/updating person 'person+#{i+1}@testingstuff.com'"
        person = Person.find_or_initialize_by(email: "person+#{i+1}@testingstuff.com")
        person.first_name = Faker::Name.first_name
        person.last_name  = "#{Faker::Name.last_name}-#{i+1}"
        person.email      = "person+#{i+1}@testingstuff.com"
        person.job        = Faker::Company.profession
        person.bio        = Faker::Lorem.paragraph
        person.gender     = [Person::MALE, Person::FEMALE].sample
        person.birthdate  = Faker::Date.between(80.years.ago, 5.years.ago)
        person.picture    = ActionController::Base.helpers.image_path(File.join("faces/", "%02d" % (rand(1..10)) + ".jpg"))
        person.save!
      end
    end
  end
end