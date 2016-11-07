require 'test_helper'

class PersonMailerTest < ActionMailer::TestCase
  setup do
    @person = build(:person)
    @person2 = build(:person2)
  end

  test "should send a mail" do
    PersonMailer.send_notification(@person,@person2, true).deliver_now
    assert !ActionMailer::Base.deliveries.empty?
  end

  test "should have content" do
    email = PersonMailer.send_notification(create(:person),create(:person2), true).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ['from@example.com'], email.from
    assert_equal ['testuser@example.com'], email.to
    assert_equal 'People App - New person added', email.subject
  end

end
