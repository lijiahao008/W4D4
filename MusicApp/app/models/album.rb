# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  live_or_studio :string
#  band_id        :integer
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Album < ActiveRecord::Base
  belongs_to :band, dependent: :destroy
  validates :live_or_studio, inclusion: ['live', 'studio'], presence: true
  validates :band_id, presence: true
  validates :title, presence: true
end
