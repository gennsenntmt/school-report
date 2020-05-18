class Student < ApplicationRecord
  # has_many :reports
  # has_many :users_studens
  # has_many :users, through: :users_studens

  enum english: { english_on: true, english_off: false }
  enum math: { math_on: true, math_off: false }
  enum japanese: { japanese_on: true, japanese_off: false }
  enum science: { science_on: true, science_off: false }
  enum social_studies: { social_studies_on: true, social_studies_off: false }

  enum grade:{
    j_first_grader:          1, #中１
    j_second_grader:         2, #中２
    j_third_grader:          3, #中３
    first_grader:            4, #高１
    second_grader:           5, #高２
    third_grader:            6, #高３
  },_prefix: true

  validates :name, uniqueness: true, presence: true, length: { maximum: 10 }
  validates :grade, presence: true
end
