# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)
    name_filter = []
    if query.empty?
      self.all
    else
      self.all.each do |student|
        name_filter << student if student.name.downcase.include?(query)
      end
      name_filter
    end
  end


end
