class Person < ActiveRecord::Base

  # == Constants
  MALE   = 0
  FEMALE = 1
  GENDERS = {
    MALE => 'Male',
    FEMALE => 'Female'
  }

  # == Validations ==
  validates :first_name, :last_name, length: { maximum: 75 }, presence: true
  validates :email, length: { maximum: 254 }, presence: true, uniqueness: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :job, allow_blank: true, length: { maximum: 75 }
  validates :gender, presence: true, inclusion: [MALE,FEMALE]
  validate :is_valid_birthday?

  # == Callbacks
  after_initialize :set_initial_gender
  before_create :send_notification
  before_destroy :send_notification

  # == Instance methods

  def gender_name
    GENDERS[self.gender]
  end

  def age
    Date.today.year - birthdate.to_date.year
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  private

  def is_valid_birthday?
    begin
      birthdate.to_date
    rescue
      errors.add(:birthdate, "must be a date")
    else
      errors.add(:birthdate, "cannot be in the future") if birthdate > Time.now
    end
  end

  def set_initial_gender
    self.gender ||= MALE
  end

  def send_notification
    Resque.enqueue(PersonMailSender, self, new_record?)
  end
end
