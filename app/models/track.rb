# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  bonus      :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :title, :ord, presence: true

  default_scope { order(ord: :asc) }

  belongs_to :album
  has_many :notes

  def bonus?
    bonus
  end
end
