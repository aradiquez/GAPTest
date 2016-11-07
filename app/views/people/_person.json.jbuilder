json.extract! person, :id, :first_name, :last_name, :email, :job, :bio, :gender, :birthdate, :picture, :created_at, :updated_at
json.url person_url(person, format: :json)