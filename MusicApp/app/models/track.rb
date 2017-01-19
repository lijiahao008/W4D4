# == Schema Information
#
# Table name: tracks
#
#  id               :integer          not null, primary key
#  name             :string
#  bonus_or_regular :string
#  lyrics           :text
#  album_id         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Track < ActiveRecord::Base
  belongs_to :album, dependent: :destroy
  has_many :notes
  validates :name, :lyrics, :album_id, presence: true
  validates :bonus_or_regular, inclusion: ['bonus', 'regular'], presence: true
end
