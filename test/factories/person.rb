FactoryGirl.define do
  factory :person do
    sequence(:email) { |n| "testuser+#{n}@example.com" }
    first_name "Test"
    last_name "User"
    birthdate '02/10/1945'
    
    factory :person2 do
      email "testuser@example.com"
      first_name "Test"
      last_name "User"
      birthdate '02/10/1950'
    end

  end
end
