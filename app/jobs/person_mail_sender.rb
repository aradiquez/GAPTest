class PersonMailSender
  @queue = :default

  def self.perform(person, new_record)
    @person = OpenStruct.new person
    Person.all.each do |send_to|
      next if @person.id == send_to.id
      PersonMailer.send_notification(@person, send_to, new_record).deliver_now
    end
  end
end