class ListItem < ActiveRecord::Base
  belongs_to :list
  validates_presence_of :name, :list, :position

  before_validation :ensure_position

  def self.update_positions(ids)
    transaction do
      ids.each_with_index do |id, index|
        where(id: id).update_all(position: index + 1)
      end
    end
  end

  private
  def ensure_position
    self.position ||= self.class.where(list_id: list_id).maximum(:position).to_i + 1
  end
end
