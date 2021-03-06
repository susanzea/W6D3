# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, uniqueness: { scope: :viewer_id,
        message: 'You already shared this with them!' }


    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork
    
    belongs_to :viewer,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :User


end
