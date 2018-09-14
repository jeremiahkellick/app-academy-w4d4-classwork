# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer
#  title      :string           not null
#  year       :integer          not null
#  studio     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, presence: true

  belongs_to :band
  has_many :tracks, dependent: :destroy

  def studio?
    studio
  end

  def live?
    !studio
  end
end
