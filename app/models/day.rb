class Day < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :foods
  has_and_belongs_to_many :symptoms
  validates_presence_of :month_day_year

  def set_month_day_year
    self.month_day_year = self.created_at.strftime("%m-%d-%y")
  end

  def day_of_week
	   self.created_at.strftime("%A")
  end

  def previous_day
    Day.find_by(id: (self.id - 1))
  end

  def two_days_ago
    Day.find_by(id: (self.id - 2))
  end

  def next_day
    Day.find_by(id: (self.id + 1))
  end

  def two_days_ahead
    Day.find_by(id: (self.id + 2))
  end

  def previous_day_symptoms
    self.previous_day.symptoms
  end

  def two_days_ago_symptoms
    self.two_days_ago.symptoms
  end

  def next_day_symptoms
    self.next_day.symptoms
  end

  def two_days_ahead_symptoms
    self.two_days_ahead.symptoms
  end
end
