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

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
