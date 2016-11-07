class PersonMailer < ApplicationMailer

  def send_notification(person, send_to, new_record)
    @recipient = person
    @send_to = send_to
    @new_record = new_record
    mail(to: "#{send_to.full_name} <#{send_to.email}>", subject: (@new_record ? "People App - New person added" : "People App - Person deleted"))
  end

end
