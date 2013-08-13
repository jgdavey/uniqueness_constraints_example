class List < ActiveRecord::Base
  has_many :items, -> { order :position }, class_name: "ListItem"
  validates_presence_of :name
end
