class Report < ApplicationRecord
  # belongs_to :user
  # belongs_to :student

  enum subject:{
    english:          1, #英語
    math:             2, #数学
    japanese:         3, #国語
    science:          4, #理科
    social_studies:   5, #社会
  },_prefix: true

  enum principal:{
    unconfirmed:     0, #未確認
    checked:         1, #確認済
    correct:         2, #要修正
  },_prefix: true

  validates :title, presence: true, length: { maximum: 15 }
  validates :description, presence: true, length: { maximum: 420 }
  validates :homework, presence: true, length: { maximum: 80 }
  validates :day, presence: true
  validates :subject, presence: true
  validates :user_id, presence: true
  validates :student_id, presence: true
end
